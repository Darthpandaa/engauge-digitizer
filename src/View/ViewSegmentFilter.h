#ifndef VIEW_SEGMENT_FILTER_H
#define VIEW_SEGMENT_FILTER_H

#include "ColorFilterSettings.h"
#include <QColor>
#include <QLabel>

class QPixmap;

/// Class that displays the current Segment Filter in a MainWindow toolbar. A gradient is displayed. No border
/// is drawn so the appearance is consistent with ViewPointStyle which would not work with a border.
class ViewSegmentFilter : public QLabel
{
public:
  /// Single constructor.
  ViewSegmentFilter(QWidget *parent = 0);


  /// Paint with a horizontal linear gradient.
  virtual void paintEvent(QPaintEvent *event);

  /// Apply the color filter of the currently selected curve. The pixmap is included so the background color can be computed.
  void setColorFilterSettings (const ColorFilterSettings &colorFilterSettings,
                               const QPixmap &pixmap);

  /// Apply no color filter
  void unsetColorFilterSettings ();

private:

  QColor colorFromSetting (FilterMode filterMode,
                           int foreground,
                           int hue,
                           int intensity,
                           int saturation,
                           int value) const;
  QColor colorHigh () const;
  QColor colorLow () const;

  ColorFilterSettings m_colorFilterSettings;
  bool m_filterIsDefined;
  QColor m_rgbBackground;
};

#endif // VIEW_SEGMENT_FILTER_H
