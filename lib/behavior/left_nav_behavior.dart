/**
 * Created by lejard_h on 18/10/15.
 */

library polymer_app_layout.left_nav_behavior;

import "dart:html";

import 'package:polymer/polymer.dart';
import '../app_layout.dart';

@behavior
abstract class LeftNavBehavior {
  var _navHeader;
  var _navFooter;
  HtmlElement get nav => $['nav'];
  PaperDrawerPanel get drawer => $['drawerPanel'];

  @property
  get navHeader => _navHeader;

  set navHeader(value) {
    if (value is String || value is HtmlElement) {
      _navHeader = value;
      notifyPath("navHeader", value);
    }
  }

  @property
  get navFooter => _navFooter;

  set navFooter(value) {
    if (value is String || value is HtmlElement) {
      _navFooter = value;
      notifyPath("navFooter", value);
    }
  }

  @Observe("selectedPage")
  selectedPageChanged(Page newValue) {
    if (nav.parent != null) {
      if (newValue.hideLeftNav) {
        nav.parent.style.setProperty("display", "none");
      } else {
        nav.parent.style.setProperty("display", "block");
      }
    }
  }

  @reflectable
  void menuItemClicked(event, [_]) {
    drawer.closeDrawer();
  }
}
