/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("layout.html")
library polymer_app_layout.elements.layout_app;

import 'package:polymer/polymer.dart';
import 'package:polymer_app_layout_template/models/models.dart';
import 'package:polymer_app_layout_template/behaviors/behaviors.dart';
import 'package:polymer_app_layout_template/elements/elements.dart';

import "package:polymer_app_layout_template/elements/layout/layout.dart";
import "package:polymer_app_layout_template/elements/list_card_over/list_card_over.dart";
import "package:polymer_app_layout_template/elements/nav_header/nav_header.dart";
import "package:polymer_app_layout_template/elements/nav_view/nav_view.dart";

import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('layout-app')
class LayoutApp extends PolymerElement with PolymerIncludeElementBehavior {
  LayoutApp.created() : super.created();

  static String get LAYOUT_NAV_VIEW => "layout-nav-view";

  static String get LAYOUT_NAV_HEADER => "layout-nav-header";

  static String get LAYOUT_LIST_CARD_OVER => "layout-list-card-over";

  var _navHeader;
  var _navFooter;

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

  String _layoutType;

  @property
  String get layoutType => _layoutType;

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

  List<AppPage> _pages;
  List _toolbarItems;

  @property
  List<AppPage> get pages => _pages;

  set pages(List<AppPage> value) {
    _pages = value;
    notifyPath("pages", value);
    _setPages(value);
  }

  @property
  List get toolbarItems => _toolbarItems;

  set toolbarItems(List value) {
    _toolbarItems = value;
    notifyPath("toolbar-items", value);
    _setToolbarItems(value);
  }

  _setToolbarItems(value) {
    if (_layout != null && (_layout is LayoutNavHeader || _layout is LayoutNavView || _layout is LayoutListCardOver)) {
      _layout.toolbarItems = value;
    }
    return _layout;
  }

  _setPages(value) {
    if (_layout != null && (_layout is LayoutNavHeader || _layout is LayoutNavView || _layout is LayoutListCardOver)) {
      _layout.pages = value;
    }
    return _layout;
  }

  _setNavHeader(value) {
    if (_layout != null && (_layout is LayoutNavHeader || _layout is LayoutNavView || _layout is LayoutListCardOver)) {
      _layout.navHeader = value;
    }
    return _layout;
  }

  _setNavFooter(value) {
    if (_layout != null && (_layout is LayoutNavHeader || _layout is LayoutNavView || _layout is LayoutListCardOver)) {
      _layout.navFooter = value;
    }
    return _layout;
  }

  _layoutIsValid(value) => (value == LAYOUT_NAV_VIEW || value == LAYOUT_LIST_CARD_OVER || value == LAYOUT_NAV_HEADER);

  _setLayout() {
    if (_layoutIsValid(layoutType)) {
      _layout = document.createElement(layoutType);
      _setPages(pages);
      _setToolbarItems(toolbarItems);
      _setNavHeader(navHeader);
      _setNavFooter(navFooter);
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
