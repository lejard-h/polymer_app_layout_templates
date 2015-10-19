/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("layout.html")
library polymer_app_layout.layout_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import "dart:html";

import 'package:polymer_include_element/polymer_include_element_behavior.dart';
import 'package:polymer_app_layout_template/app_layout.dart';

@PolymerRegister('layout-app')
class LayoutApp extends PolymerElement with PolymerIncludeElementBehavior {
  LayoutApp.created() : super.created();

  static String get LAYOUT_NAV_VIEW => "layout-nav-view";

  static String get LAYOUT_NAV_HEADER => "layout-nav-header";

  static String get LAYOUT_LIST_CARD_OVER => "layout-list-card-over";

  String _layoutType;

  @property
  String get layoutType => _layoutType;

  @reflectable
  void set layoutType(String value) {
    if (_layoutIsValid(value) && value != _layoutType) {
      _layoutType = value;
      _setLayout();
      notifyPath("layoutType", value);
    } else {}
  }

  HtmlElement _layout = null;

  @property
  HtmlElement get layout => _layout;

  List<Page> _pages;
  List _toolbarItems;

  @property
  List<Page> get pages => _pages;

  @reflectable
  set pages(List<Page> value) {
    _pages = value;
    notifyPath("pages", value);
    _setPages(value);
  }

  @property
  List get toolbarItems => _toolbarItems;

  @reflectable
  set toolbarItems(List value) {
    _toolbarItems = value;
    notifyPath("toolbar-items", value);
    _setToolbarItems(value);
  }

  _setToolbarItems(value) {
    if (_layout != null) {
      if (_layout is LayoutNavHeader) {
        (_layout as LayoutNavHeader).toolbarItems = value;
      } else if (_layout is LayoutNavView) {
        (_layout as LayoutNavView).toolbarItems = value;
      } else if (_layout is LayoutListCardOver) {
        (_layout as LayoutListCardOver).toolbarItems = value;
      }
    }
    return _layout;
  }

  _setPages(value) {
    if (_layout != null) {
      if (_layout is LayoutNavHeader) {
        (_layout as LayoutNavHeader).pages = value;
      } else if (_layout is LayoutNavView) {
        (_layout as LayoutNavView).pages = value;
      } else if (_layout is LayoutListCardOver) {
        (_layout as LayoutListCardOver).pages = value;
      }
    }
    return _layout;
  }

  _layoutIsValid(value) => (value == LAYOUT_NAV_VIEW ||
      value == LAYOUT_LIST_CARD_OVER ||
      value == LAYOUT_NAV_HEADER);

  _setLayout() {
    if (_layoutIsValid(layoutType)) {
      _layout = document.createElement(layoutType);
      _setPages(pages);
      _setToolbarItems(toolbarItems);
      include(_layout, Polymer.dom(this.root));
      notifyPath("layout", _layout);
    }
  }

  ready() {
    if (layoutType == null) {
      layoutType = LAYOUT_NAV_VIEW;
    }
  }
}
