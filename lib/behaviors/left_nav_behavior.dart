/**
 * Created by lejard_h on 18/10/15.
 */

library polymer_app_layout.behaviors.left_nav_behavior;

import "dart:html";

import 'package:polymer/polymer.dart';
import 'package:polymer_app_layout_template/models/models.dart';
import 'package:polymer_app_layout_template/elements/elements.dart';

@behavior
abstract class LeftNavBehavior {
  var _navHeader;
  var _navFooter;
  HtmlElement get nav => $['nav'];
  PaperDrawerPanel get drawer => $['drawerPanel'];
  String _appName;
  bool _navHeaderIsValid;

  @property
  String get appName => _appName;

  set appName(String value) {
    _appName = value;
    notifyPath('appName', value);
  }

  @Property(notify: true)
  bool get navHeaderIsValid {
    return _navHeaderIsValid;
  }

  set navHeaderIsValid(bool value) {
    _navHeaderIsValid = value;
    notifyPath('navHeaderIsValid', value);
  }


  /// Define the element to show in the nav Header.
  /// Can be an [HtmlElement] or the element name as a [String].



  @Property(notify: true)
  get navHeader => _navHeader;

  void set navHeader(value) {
    if ((value is String || value is HtmlElement) && value != _navHeader) {
      _navHeader = value;
      navHeaderIsValid = navHeader is String || navHeader is HtmlElement;
      notifyPath("navHeader", value);
    }
  }

  /// Define the element to show in the nav Footer.
  /// Can be an [HtmlElement] or the element name as a [String].
  @Property(notify: true, reflectToAttribute: true)
  get navFooter => _navFooter;

  void set navFooter(value) {
    if ((value is String || value is HtmlElement) && value != _navFooter) {
      _navFooter = value;
      notifyPath("navFooter", value);
    }
  }

  @Observe("selectedPage")
  selectedPageChanged(AppPage newValue) {
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
