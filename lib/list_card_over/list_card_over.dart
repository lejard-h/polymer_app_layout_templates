/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("list_card_over.html")
library polymer_app_layout.layout_list_card_over;

import "dart:html";

import 'package:polymer/polymer.dart';
import 'package:polymer_app_layout_template/app_layout.dart';
import 'package:polymer_app_layout_template/behavior/toolbar_behavior.dart';
import 'package:polymer_route_behavior/polymer_route_behavior.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('layout-list-card-over')
class LayoutListCardOver extends PolymerElement with PolymerRouteBehavior, ToolbarBehavior {
  bool _isMobile;
  String _mainMode;
  String _drawerWidth;
  String _toolbarClass;

  @property
  String get toolbarClass => _toolbarClass;

  set toolbarClass(String value) {
    _toolbarClass = value;
    notifyPath("toolbarClass", value);
  }

  @property
  String get drawerWidth => _drawerWidth;

  void set drawerWidth(String value) {
    _drawerWidth = value;
    notifyPath("drawerWidth", value);
  }

  @property
  bool get isMobile => _isMobile;

  void set isMobile(bool value) {
    _isMobile = value;
    notifyPath("isMobile", value);
  }

  @property
  String get mainMode => _mainMode;

  void set mainMode(String value) {
    _mainMode = value;
    notifyPath("mainMode", value);
  }

  LayoutListCardOver.created() : super.created();

  PaperDrawerPanel get drawerPanel => $['drawerPanel'];

  listTap(event, _) {
    drawerPanel.closeDrawer();
  }

  @Observe("_isMobile")
  isMobileChanged(bool newValue) {
    mainMode = newValue ? 'seamed' : 'cover';
    drawerWidth = newValue ? '100%' : '320px';
    toolbarClass = newValue ? '' : 'tall';
    updateStyles();
  }

  PaperDrawerPanel get drawer => $['drawerPanel'];

  @reflectable
  void menuItemClicked(event, [_]) {
    drawer.closeDrawer();
  }

  var _navHeader;

  @property
  get navHeader => _navHeader;

  set navHeader(value) {
    if (value is String || value is HtmlElement) {
      _navHeader = value;
      notifyPath("navHeader", value);
    }
  }

  @reflectable
  bool isIconString(AppPage page) {
    try {
      return page.icon is String;
    } catch (e) {
      return false;
    }
  }

  @reflectable
  bool isIconHtmlElement(AppPage page) {
    try {
      return page.icon is HtmlElement;
    } catch (e) {
      return false;
    }
  }

  HtmlElement get nav => $['nav'];

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
}
