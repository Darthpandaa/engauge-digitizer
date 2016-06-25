/******************************************************************************************************
 * (C) 2014 markummitchell@github.com. This file is part of Engauge Digitizer, which is released      *
 * under GNU General Public License version 2 (GPLv2) or (at your option) any later version. See file *
 * LICENSE or go to gnu.org/licenses for details. Distribution requires prior written permission.     *
 ******************************************************************************************************/

#include "DlgPdfFrame.h"
#include "EngaugeAssert.h"
#include "Logger.h"
#include "MainWindow.h"
#include "poppler-qt5.h"
#include <QApplication>
#include <QGraphicsPixmapItem>
#include <QGraphicsScene>
#include <QImage>
#include <QLabel>
#include <QLayout>
#include <QPushButton>
#include <QSettings>
#include <QSpinBox>
#include <QTimer>
#include "Settings.h"
#include "ViewPreview.h"

using namespace Poppler;

int DlgPdfFrame::MINIMUM_DIALOG_WIDTH = 350;
int DlgPdfFrame::MINIMUM_PREVIEW_HEIGHT = 200;
const int X_TOP_LEFT = 0, Y_TOP_LEFT = 0;
const int WIDTH = -1, HEIGHT = -1; // Negative values give full page
const int FIRST_PAGE_1_BASED = 1;
const int SMALLEST_DELAY_MS = 500; // Below 500 triggers "double jump" bug in linux

DlgPdfFrame::DlgPdfFrame(const Poppler::Document &document,
                         int resolution) :
  m_document (document),
  m_resolution (resolution)
{
  LOG4CPP_INFO_S ((*mainCat)) << "DlgPdfFrame::DlgPdfFrame";

  setWindowTitle (tr ("PDF Frame"));
  setModal (true);

  QWidget *subPanel = new QWidget ();
  QGridLayout *layout = new QGridLayout (subPanel);
  subPanel->setLayout (layout);

  int row = 0;

  createTimer ();
  createPageSpinner (layout, row);
  createPreview (layout, row);
  finishPanel (subPanel);
  initializeFrameGeometryAndPixmap (); // Before first call to updatePreview
  updatePreview ();

  // Bring the two middle columns together
  layout->setColumnStretch (0, 1);
  layout->setColumnStretch (1, 0);
  layout->setColumnStretch (2, 0);
  layout->setColumnStretch (3, 1);
}

DlgPdfFrame::~DlgPdfFrame()
{
  LOG4CPP_INFO_S ((*mainCat)) << "DlgPdfFrame::~DlgPdfFrame";
}

void DlgPdfFrame::createPageSpinner (QGridLayout *layout,
                                     int &row)
{
  LOG4CPP_INFO_S ((*mainCat)) << "DlgPdfFrame::createPageSpinner";

  QLabel *labelPage = new QLabel (tr ("Page:"));
  layout->addWidget (labelPage, row, 1, 1, 1);

  m_spinPage = new QSpinBox;
  m_spinPage->setWhatsThis (tr ("Page number that will be imported"));
  m_spinPage->setRange (1, m_document.numPages());
  layout->addWidget (m_spinPage, row++, 2, 1, 1);
  connect (m_spinPage, SIGNAL (valueChanged (int)), this, SLOT (slotPage (int)));
}

void DlgPdfFrame::createPreview (QGridLayout *layout,
                                 int &row)
{
  LOG4CPP_INFO_S ((*mainCat)) << "DlgPdfFrame::createPreview";

  QLabel *labelPreview = new QLabel (tr ("Preview"));
  layout->addWidget (labelPreview, row++, 0, 1, 1, Qt::AlignLeft);

  m_scenePreview = new QGraphicsScene (this);
  m_viewPreview = new ViewPreview (m_scenePreview,
                                   ViewPreview::VIEW_ASPECT_RATIO_VARIABLE,
                                   this);
  m_viewPreview->setWhatsThis (tr ("Preview window that shows how current settings affect pdf import"));
  m_viewPreview->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  m_viewPreview->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  m_viewPreview->setMinimumHeight (MINIMUM_PREVIEW_HEIGHT);
  layout->addWidget (m_viewPreview, row++, 0, 1, 4);
}

void DlgPdfFrame::createTimer ()
{
  m_timer = new QTimer;
  m_timer->setSingleShot (true);
  connect (m_timer, SIGNAL (timeout ()), this, SLOT (slotTimeout ()));
}

void DlgPdfFrame::finishPanel (QWidget *subPanel)
{
  const int STRETCH_OFF = 0, STRETCH_ON = 1;

  QVBoxLayout *panelLayout = new QVBoxLayout (this);

  setMinimumWidth (MINIMUM_DIALOG_WIDTH);
  setLayout (panelLayout);

  panelLayout->addWidget (subPanel);
  panelLayout->setStretch (panelLayout->count () - 1, STRETCH_ON);

  QWidget *panelButtons = new QWidget (this);
  QHBoxLayout *buttonLayout = new QHBoxLayout (panelButtons);

  QHBoxLayout *layoutRightSide = new QHBoxLayout;

  QWidget *widgetRightSide = new QWidget;
  widgetRightSide->setLayout (layoutRightSide);
  buttonLayout->addWidget (widgetRightSide);

  QSpacerItem *spacerExpanding = new QSpacerItem (40, 5, QSizePolicy::Expanding, QSizePolicy::Expanding);
  layoutRightSide->addItem (spacerExpanding);

  m_btnOk = new QPushButton (tr ("Ok"));
  layoutRightSide->addWidget (m_btnOk, 0, Qt::AlignRight);
  connect (m_btnOk, SIGNAL (released ()), this, SLOT (slotOk ()));

  QSpacerItem *spacerFixed = new QSpacerItem (40, 5, QSizePolicy::Fixed, QSizePolicy::Fixed);
  layoutRightSide->addItem (spacerFixed);

  m_btnCancel = new QPushButton (tr ("Cancel"));
  layoutRightSide->addWidget (m_btnCancel, 0, Qt::AlignRight);
  connect (m_btnCancel, SIGNAL (released ()), this, SLOT (slotCancel ()));

  panelLayout->addWidget (panelButtons, STRETCH_ON);
  panelLayout->setStretch (panelLayout->count () - 1, STRETCH_OFF);
}

QImage DlgPdfFrame::image () const
{
  return m_image;
}

void DlgPdfFrame::initializeFrameGeometryAndPixmap ()
{
  m_image = loadImage (FIRST_PAGE_1_BASED);
  QGraphicsPixmapItem *pixmap = new QGraphicsPixmapItem (QPixmap::fromImage (m_image));
  m_scenePreview->addItem (pixmap);

  // Force resize so image fills preview area. We do this only once initially for speed
  m_viewPreview->setSceneRect (pixmap->boundingRect ());
}

QImage DlgPdfFrame::loadImage (int page1Based) const
{
  QImage image;

  int page0Based = page1Based - 1;
  Page *page = m_document.page (page0Based);
  if (page != 0) {

    image = page->renderToImage (m_resolution,
                                 m_resolution,
                                 X_TOP_LEFT,
                                 Y_TOP_LEFT,
                                 WIDTH,
                                 HEIGHT);
  }

  return image;
}

void DlgPdfFrame::saveGeometryToSettings()
{
  // Store the settings for use by showEvent
  QSettings settings;
  settings.beginGroup (SETTINGS_GROUP_PDF);
  settings.setValue (SETTINGS_PDF_POS, saveGeometry ());
  settings.endGroup();
}

void DlgPdfFrame::showEvent (QShowEvent * /* event */)
{
  QSettings settings;
  settings.beginGroup (SETTINGS_GROUP_PDF);
  if (settings.contains (SETTINGS_PDF_POS)) {

    // Restore the settings that were stored by the last call to saveGeometryToSettings
    restoreGeometry (settings.value (SETTINGS_PDF_POS).toByteArray ());
  }
}

void DlgPdfFrame::slotCancel ()
{
  LOG4CPP_INFO_S ((*mainCat)) << "DlgPdfFrame::slotCancel";

  setResult (QDialog::Rejected);
  saveGeometryToSettings();
  hide();
}

void DlgPdfFrame::slotOk ()
{
  LOG4CPP_INFO_S ((*mainCat)) << "DlgPdfFrame::slotOk";

  setResult (QDialog::Accepted);
  saveGeometryToSettings();
  hide();
}

void DlgPdfFrame::slotPage (int page)
{
  LOG4CPP_INFO_S ((*mainCat)) << "DlgPdfFrame::slotPage"
                              << " page=" << page
                              << " stepBy=" << m_spinPage->singleStep ();

  // Show wait cursor until slow calculations are over
  QApplication::setOverrideCursor (Qt::WaitCursor);

  m_timer->start (SMALLEST_DELAY_MS);
}

void DlgPdfFrame::slotTimeout ()
{
  LOG4CPP_INFO_S ((*mainCat)) << "DlgPdfFrame::slotTimeout";

  updatePreview ();
}

void DlgPdfFrame::updatePreview ()
{
  LOG4CPP_INFO_S ((*mainCat)) << "DlgPdfFrame::updatePreview";

  m_scenePreview->clear ();

  m_image = loadImage (m_spinPage->value ());
  QGraphicsPixmapItem *pixmap = new QGraphicsPixmapItem (QPixmap::fromImage (m_image));
  m_scenePreview->addItem (pixmap);

  // Calculations for preview updating are now over
  QApplication::restoreOverrideCursor ();
}
