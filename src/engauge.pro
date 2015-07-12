TEMPLATE    = app
CONFIG      = qt warn_on thread debug
OBJECTS_DIR = .objs
MOC_DIR = .moc
RCC_DIR = .rcc

HEADERS  += \
    include/BackgroundImage.h \
    Callback/CallbackAddPointsInCurvesGraphs.h \
    Callback/CallbackAxesCheckerFromAxesPoints.h \
    Callback/CallbackAxisPointsAbstract.h \
    Callback/CallbackBoundingRects.h \
    Callback/CallbackCheckAddPointAxis.h \
    Callback/CallbackCheckEditPointAxis.h \
    Callback/CallbackPointOrdinal.h \
    Callback/CallbackRemovePointsInCurvesGraphs.h \
    Callback/CallbackSceneUpdateAfterCommand.h \
    Callback/CallbackSearchReturn.h \
    Callback/CallbackUpdateTransform.h \
    Checker/Checker.h \
    Checker/CheckerMode.h \
    Cmd/CmdAbstract.h \
    Cmd/CmdAddPointAxis.h \
    Cmd/CmdAddPointGraph.h \
    Cmd/CmdCopy.h \
    Cmd/CmdCut.h \
    Cmd/CmdDelete.h \
    Cmd/CmdEditPointAxis.h \
    Cmd/CmdFactory.h \
    Cmd/CmdMediator.h \
    Cmd/CmdMoveBy.h \
    Cmd/CmdPaste.h \
    Cmd/CmdSettingsAxesChecker.h \
    Cmd/CmdSettingsColorFilter.h \
    Cmd/CmdSettingsCoords.h \
    Cmd/CmdSettingsCurveProperties.h \
    Cmd/CmdSettingsCurves.h \
    Cmd/CmdSettingsExport.h \
    Cmd/CmdSettingsGridRemoval.h \
    Cmd/CmdSettingsPointMatch.h \
    Cmd/CmdSettingsSegments.h \
    Cmd/CmdStackShadow.h \
    Color/ColorConstants.h \
    Color/ColorFilter.h \
    Color/ColorFilterEntry.h \
    Color/ColorFilterHistogram.h \
    Color/ColorFilterMode.h \
    Color/ColorFilterSettings.h \
    Color/ColorPalette.h \
    Coord/CoordScale.h \
    Coord/CoordsType.h \
    Coord/CoordThetaUnits.h \
    Correlation/Correlation.h \
    Curve/Curve.h \
    Curve/CurveConnectAs.h \
    Curve/CurveNameList.h \
    Curve/CurveNameListEntry.h \
    Curve/CurveSettingsInt.h \
    Curve/CurvesGraphs.h \
    Curve/CurveStyle.h \
    Curve/CurveStyles.h \
    util/DataKey.h \
    DigitizeState/DigitizeStateAbstractBase.h \
    DigitizeState/DigitizeStateAxis.h \
    DigitizeState/DigitizeStateColorPicker.h \
    DigitizeState/DigitizeStateContext.h \
    DigitizeState/DigitizeStateCurve.h \
    DigitizeState/DigitizeStateEmpty.h \
    DigitizeState/DigitizeStatePointMatch.h \
    DigitizeState/DigitizeStateScale.h \
    DigitizeState/DigitizeStateSegment.h \
    DigitizeState/DigitizeStateSelect.h \
    Dlg/DlgAbout.h \
    Dlg/DlgEditPoint.h \
    Dlg/DlgErrorReport.h \
    Dlg/DlgFilterCommand.h \
    Dlg/DlgFilterThread.h \
    Dlg/DlgFilterWorker.h \
    Dlg/DlgSettingsAbstractBase.h \
    Dlg/DlgSettingsAxesChecker.h \
    Dlg/DlgSettingsColorFilter.h \
    Dlg/DlgSettingsCoords.h \
    Dlg/DlgSettingsCurves.h \
    Dlg/DlgSettingsCurveProperties.h \
    Dlg/DlgSettingsExport.h \
    Dlg/DlgSettingsGridRemoval.h \
    Dlg/DlgSettingsPointMatch.h \
    Dlg/DlgSettingsSegments.h \
    Dlg/DlgValidatorLog.h \
    Document/Document.h \
    Document/DocumentModelAbstractBase.h \
    Document/DocumentModelAxesChecker.h \
    Document/DocumentModelColorFilter.h \
    Document/DocumentModelCoords.h \
    Document/DocumentModelExport.h \
    Document/DocumentModelGridRemoval.h \
    Document/DocumentModelPointMatch.h \
    Document/DocumentModelSegments.h \
    Document/DocumentSerialize.h \
    include/EngaugeAssert.h \
    util/EnumsToQt.h \
    Export/ExportDelimiter.h \
    Export/ExportLayoutFunctions.h \
    Export/ExportPointsSelectionFunctions.h \
    Export/ExportPointsSelectionRelations.h \
    Export/ExportDelimiter.h \
    Export/ExportHeader.h \
    Export/ExportToClipboard.h \
    Export/ExportToFile.h \
    Callback/functor.h \
    Graphics/GraphicsArcItem.h \
    Graphics/GraphicsItemType.h \
    Graphics/GraphicsLinesForCurve.h \
    Graphics/GraphicsLinesForCurves.h \
    Graphics/GraphicsPoint.h \
    Graphics/GraphicsPointAbstractBase.h \
    Graphics/GraphicsPointEllipse.h \
    Graphics/GraphicsPointFactory.h \
    Graphics/GraphicsPointPolygon.h \
    Graphics/GraphicsScene.h \
    Graphics/GraphicsView.h \
    Grid/GridClassifier.h \
    Grid/GridCoordDisable.h \
    Line/LineStyle.h \
    Load/LoadImageFromUrl.h \
    Logger/Logger.h \
    Logger/LoggerUpload.h \
    main/MainWindow.h \
    Mime/MimePoints.h \
    util/mmsubs.h \
    Ordinal/OrdinalGenerator.h \
    include/OrdinalToGraphicsPoint.h \
    Point/Point.h \
    Point/PointIdentifiers.h \
    Point/PointShape.h \
    Point/PointStyle.h \
    util/QtToString.h \
    Segment/Segment.h \
    Segment/SegmentFactory.h \
    Segment/SegmentLine.h \
    Settings/Settings.h \
    Spline/Spline.h \
    Spline/SplineCoeff.h \
    Spline/SplinePair.h \
    StatusBar/StatusBar.h \
    StatusBar/StatusBarMode.h \
    Transformation/Transformation.h \
    Transformation/TransformationStateAbstractBase.h \
    Transformation/TransformationStateContext.h \
    Transformation/TransformationStateDefined.h \
    Transformation/TransformationStateUndefined.h \
    util/Version.h \
    View/ViewPointStyle.h \
    View/ViewPreview.h \
    View/ViewProfile.h \
    View/ViewProfileDivider.h \
    View/ViewProfileParameters.h \
    View/ViewProfileScale.h \
    View/ViewSegmentFilter.h \
    util/Xml.h \
    include/ZoomFactor.h

SOURCES += \
    Callback/CallbackAddPointsInCurvesGraphs.cpp \
    Callback/CallbackAxesCheckerFromAxesPoints.cpp \
    Callback/CallbackAxisPointsAbstract.cpp \
    Callback/CallbackBoundingRects.cpp \
    Callback/CallbackCheckAddPointAxis.cpp \
    Callback/CallbackCheckEditPointAxis.cpp \
    Callback/CallbackPointOrdinal.cpp \
    Callback/CallbackRemovePointsInCurvesGraphs.cpp \
    Callback/CallbackSceneUpdateAfterCommand.cpp \
    Callback/CallbackUpdateTransform.cpp \
    Checker/Checker.cpp \
    Checker/CheckerMode.cpp \
    Cmd/CmdAbstract.cpp \
    Cmd/CmdAddPointAxis.cpp \
    Cmd/CmdAddPointGraph.cpp \
    Cmd/CmdCopy.cpp \
    Cmd/CmdCut.cpp \
    Cmd/CmdDelete.cpp \
    Cmd/CmdEditPointAxis.cpp \
    Cmd/CmdFactory.cpp \
    Cmd/CmdMediator.cpp \
    Cmd/CmdMoveBy.cpp \
    Cmd/CmdPaste.cpp \
    Cmd/CmdSettingsAxesChecker.cpp \
    Cmd/CmdSettingsColorFilter.cpp \
    Cmd/CmdSettingsCoords.cpp \
    Cmd/CmdSettingsCurveProperties.cpp \
    Cmd/CmdSettingsCurves.cpp \
    Cmd/CmdSettingsExport.cpp \
    Cmd/CmdSettingsGridRemoval.cpp \
    Cmd/CmdSettingsPointMatch.cpp \
    Cmd/CmdSettingsSegments.cpp \
    Cmd/CmdStackShadow.cpp \
    Color/ColorFilter.cpp \
    Color/ColorFilterHistogram.cpp \
    Color/ColorFilterMode.cpp \
    Color/ColorFilterSettings.cpp \
    Color/ColorPalette.cpp \
    Coord/CoordScale.cpp \
    Coord/CoordsType.cpp \
    Coord/CoordThetaUnits.cpp \
    Correlation/Correlation.cpp \
    Curve/Curve.cpp \
    Curve/CurveConnectAs.cpp \
    Curve/CurveNameList.cpp \
    Curve/CurveNameListEntry.cpp \
    Curve/CurveSettingsInt.cpp \
    Curve/CurvesGraphs.cpp \
    Curve/CurveStyle.cpp \
    Curve/CurveStyles.cpp \
    util/DataKey.cpp \
    DigitizeState/DigitizeStateAbstractBase.cpp \
    DigitizeState/DigitizeStateAxis.cpp \
    DigitizeState/DigitizeStateColorPicker.cpp \
    DigitizeState/DigitizeStateContext.cpp \
    DigitizeState/DigitizeStateCurve.cpp \
    DigitizeState/DigitizeStateEmpty.cpp \
    DigitizeState/DigitizeStatePointMatch.cpp \
    DigitizeState/DigitizeStateScale.cpp \
    DigitizeState/DigitizeStateSegment.cpp \
    DigitizeState/DigitizeStateSelect.cpp \
    Dlg/DlgAbout.cpp \
    Dlg/DlgEditPoint.cpp \
    Dlg/DlgErrorReport.cpp \
    Dlg/DlgFilterCommand.cpp \
    Dlg/DlgFilterThread.cpp \
    Dlg/DlgFilterWorker.cpp \
    Dlg/DlgSettingsAbstractBase.cpp \
    Dlg/DlgSettingsAxesChecker.cpp \
    Dlg/DlgSettingsColorFilter.cpp \
    Dlg/DlgSettingsCoords.cpp \
    Dlg/DlgSettingsCurves.cpp \
    Dlg/DlgSettingsCurveProperties.cpp \
    Dlg/DlgSettingsExport.cpp \
    Dlg/DlgSettingsGridRemoval.cpp \
    Dlg/DlgSettingsPointMatch.cpp \
    Dlg/DlgSettingsSegments.cpp \
    Dlg/DlgValidatorLog.cpp \
    Document/Document.cpp \
    Document/DocumentModelAbstractBase.cpp \
    Document/DocumentModelAxesChecker.cpp \
    Document/DocumentModelColorFilter.cpp \
    Document/DocumentModelCoords.cpp \
    Document/DocumentModelExport.cpp \
    Document/DocumentModelGridRemoval.cpp \
    Document/DocumentModelPointMatch.cpp \
    Document/DocumentModelSegments.cpp \
    Document/DocumentSerialize.cpp \
    util/EnumsToQt.cpp \
    Export/ExportDelimiter.cpp \
    Export/ExportHeader.cpp \
    Export/ExportLayoutFunctions.cpp \
    Export/ExportPointsSelectionFunctions.cpp \
    Export/ExportPointsSelectionRelations.cpp \
    Export/ExportToClipboard.cpp \
    Export/ExportToFile.cpp \
    Graphics/GraphicsArcItem.cpp \
    Graphics/GraphicsLinesForCurve.cpp \
    Graphics/GraphicsLinesForCurves.cpp \
    Graphics/GraphicsPoint.cpp \
    Graphics/GraphicsPointAbstractBase.cpp \
    Graphics/GraphicsPointEllipse.cpp \
    Graphics/GraphicsPointFactory.cpp \
    Graphics/GraphicsPointPolygon.cpp \
    Graphics/GraphicsScene.cpp \
    Graphics/GraphicsView.cpp \
    Grid/GridClassifier.cpp \
    Grid/GridCoordDisable.cpp \
    Line/LineStyle.cpp \
    Load/LoadImageFromUrl.cpp \
    Logger/Logger.cpp \
    Logger/LoggerUpload.cpp \
    main/main.cpp \
    main/MainWindow.cpp \
    Mime/MimePoints.cpp \
    Ordinal/OrdinalGenerator.cpp \
    util/mmsubs.cpp \
    Point/Point.cpp \
    Point/PointIdentifiers.cpp \
    Point/PointShape.cpp \
    Point/PointStyle.cpp \
    util/QtToString.cpp \
    Segment/Segment.cpp \
    Segment/SegmentFactory.cpp \
    Segment/SegmentLine.cpp \
    Settings/Settings.cpp \
    Spline/Spline.cpp \
    Spline/SplineCoeff.cpp \
    Spline/SplinePair.cpp \
    StatusBar/StatusBar.cpp \
    Transformation/Transformation.cpp \
    Transformation/TransformationStateAbstractBase.cpp \
    Transformation/TransformationStateContext.cpp \
    Transformation/TransformationStateDefined.cpp \
    Transformation/TransformationStateUndefined.cpp \
    util/Version.cpp \
    View/ViewPointStyle.cpp \
    View/ViewPreview.cpp \
    View/ViewProfile.cpp \
    View/ViewProfileDivider.cpp \
    View/ViewProfileParameters.cpp \
    View/ViewProfileScale.cpp \
    View/ViewSegmentFilter.cpp \
    util/Xml.cpp

TARGET = ../bin/engauge

QT += core gui network printsupport widgets xml

LIBS += -llog4cpp -lfftw3
INCLUDEPATH += Callback \
               Checker \
               Cmd \
               Color \
               Coord \
               Correlation \
               Curve \
               DigitizeState \
               Dlg \
               Document \
               Export \
               Graphics \
               Grid \
               img \
               include \
               Line \
               Load \
               Logger \
               main \
               Mime \
               Ordinal \
               Plot \
               Point \
               Settings \
               Spline \
               StatusBar \
               Transformation \
               util \
               View

RESOURCES += \
    engauge.qrc
