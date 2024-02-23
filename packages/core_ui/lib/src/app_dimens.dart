import 'package:flutter/animation.dart';

abstract class AppDimens {
  /// Common
  static const Duration COLOR_CHANGE_DURATION = Duration(milliseconds: 160);
  static const Curve COLOR_CHANGE_CURVE = Curves.linear;
  static const double DEFAULT_BORDER_RADIUS = 12;

  /// Dialogs
  static const Duration DIALOG_TRANSITION_DURATION = Duration(milliseconds: 250);
  static const Duration DIALOG_REVERSE_TRANSITION_DURATION = Duration(milliseconds: 250);
  static const double DEFAULT_DIALOG_WIDTH = 600;
  static const double DIALOG_SCREEN_EDGE_PADDING_X = 240;
  static const double DIALOG_SCREEN_EDGE_PADDING_Y = 120;

  /// AppNavigationBar
  static const double NAVIGATION_BAR_HEIGHT = 60;
  static const double NAVIGATION_BAR_ITEM_PADDING_X = 16;
  static const double NAVIGATION_BAR_ITEM_PADDING_Y = 4;
  static const double NAVIGATION_BAR_ITEM_MIN_WIDTH = 60;
  static const double NAVIGATION_BAR_ELEVATION = 8;

  /// Page templates
  static const double PAGE_CONTENT_PADDING = 16;
  static const int PAGE_CONTENT_WIDTH_WEIGHT = 4;
  static const double PAGE_CONTENT_BORDER_THICKNESS = 1;

  /// Lists
  static const double LIST_ITEM_MIN_HEIGHT = 60;
  static const double LIST_ITEM_CONTENT_PADDING_X = 12;
  static const double LIST_ITEM_CONTENT_PADDING_Y = 8;
  static const double LIST_ITEMS_GAP = 6;

  /// Table
  static const double TABLE_ROW_MIN_HEIGHT = 50;
  static const double TABLE_ROW_CONTENT_PADDING_X = 12;
  static const double TABLE_ROW_CONTENT_PADDING_Y = 8;

  /// AppButton
  static const double APP_BUTTON_MIN_HEIGHT = 50;
  static const double APP_BUTTON_MIN_WIDTH = 200;

  /// Inputs
  static const double MIN_INPUT_HEIGHT = 40;
  static const double INPUT_HEIGHT = 50;
  static const double TEXT_HEIGHT = 35;

  /// TextFields
  static const double TEXT_FIELD_PADDING_X = 6;
  static const double TEXT_FIELD_PADDING_Y = 4;
  static const double INPUT_BORDER_THICKNESS = 2;
  static const Duration ON_CHANGED_DELAY = Duration(milliseconds: 400);
}
