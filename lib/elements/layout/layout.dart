/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("layout.html")
library polymer_app_layout.elements.layout_app;

import 'package:polymer/polymer.dart';
import 'package:polymer_app_layout_template/models/models.dart';
import 'package:polymer_app_layout_template/behaviors/behaviors.dart';
import 'package:polymer_app_layout_template/elements/elements.dart';

import "package:polymer_app_layout_template/elements/list_card_over/list_card_over.dart";
import "package:polymer_app_layout_template/elements/nav_header/nav_header.dart";
import "package:polymer_app_layout_template/elements/nav_view/nav_view.dart";
import "package:polymer_app_layout_template/elements/loading_element/loading_element.dart";

import 'package:web_components/web_components.dart' show HtmlImport;

/**
 * Usage
 *
 * Html
 *      <layout-app pages="{{pages}}" toolbar-items="{{toolbarItems}}" layout-type="layout-nav-header"></layout-app>
 *
 *
 * Dart Polymer Element
 *
 *      @property
 *      List<Page> get pages => [
 *        new Page("Home", "home", "home-page", isDefault: true),
 *        new Page("One", "one", "page-one"),
 *        new Page("Two", "two", "page-two", menu: false)
 *      ];
 *
 *      @property
 *      List get toolbarItems => [
 *        'toolbar-more-button' // or document.createElement('toolbar-more-button');
 *      ];
 *
 *      @Listen(PolymerRouteBehavior.page_changed_event)
 *      pageChanged(CustomEventWrapper e, [_]) {
 *        print("page changed => ${(e.detail as Page)}");
 *      }
 *
 *      @Listen(PolymerRouteBehavior.path_changed_event)
 *      pathChanged(CustomEventWrapper e, [_]) {
 *        print("path changed => ${e.detail}");
 *      }
 *
 *      gotToHome() {
 *        PolymerRouteBehavior.goToDefault();
 *      }
 *
 *      gotToPage(String pageName) {
 *        PolymerRouteBehavior.goToName(pageName);
 *      }
 */
@PolymerRegister('layout-app')
class LayoutApp extends PolymerElement with PolymerIncludeElementBehavior {
  LayoutApp.created() : super.created();

  static String get layout_nav_view => "layout-nav-view";

  static String get layout_nav_header => "layout-nav-header";

  static String get layout_list_card_over => "layout-list-card-over";

  var _navHeader;
  var _navFooter;
  String _layoutType;
  HtmlElement _layout;
  List<AppPage> _pages;
  List _toolbarItems;

  /// Define the element to show in the nav Header.
  /// Can be an [HtmlElement] or the element name as a [String].
  @Property(notify: true)
  get navHeader => _navHeader;

  set navHeader(value) {
    if (value is String || value is HtmlElement) {
      _navHeader = value;
      notifyPath("navHeader", value);
      _setNavHeader(navHeader);
    }
  }

  /// Define the element to show in the nav Footer.
  /// Can be an [HtmlElement] or the element name as a [String].
  @Property(notify: true)
  get navFooter => _navFooter;

  set navFooter(value) {
    if (value is String || value is HtmlElement) {
      _navFooter = value;
      notifyPath("navFooter", value);
      _setNavFooter(navFooter);
    }
  }

  /// Define the type of layout
  /// * layout-nav-view
  /// * layout-nav-header
  /// * layout-list-card-over
  @property
  String get layoutType => _layoutType;

  void set layoutType(String value) {
    if (_layoutIsValid(value) && value != _layoutType) {
      _layoutType = value;
      _setLayout();
      notifyPath("layoutType", value);
    } else {}
  }

  @property
  HtmlElement get layout => _layout;

  /// Pages config
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
    if (_layout != null && _layout is ToolbarBehavior) {
      (_layout as ToolbarBehavior).toolbarItems = value;
    }
    return _layout;
  }

  _setPages(value) {
    if (_layout != null && _layout is PolymerRouteBehavior) {
      (_layout as PolymerRouteBehavior).pages = value;
    }
    return _layout;
  }

  _setNavHeader(value) {
    if (_layout != null && _layout is LeftNavBehavior) {
      (_layout as LeftNavBehavior).navHeader = value;
    }
    return _layout;
  }

  _setNavFooter(value) {
    if (_layout != null && _layout is LeftNavBehavior) {
      (_layout as LeftNavBehavior).navFooter = value;
    }
    return _layout;
  }

  _layoutIsValid(value) => (value == layout_nav_view || value == layout_list_card_over || value == layout_nav_header);

  _setLayout() {
    if (_layoutIsValid(layoutType)) {
      _layout = document.createElement(layoutType);
      _setPages(pages);
      _setToolbarItems(toolbarItems);
      _setNavHeader(navHeader);
      _setNavFooter(navFooter);
      include(_layout, Polymer.dom($['container']));
      notifyPath("layout", _layout);
    }
  }

  ready() {
    _toastElement = $['toast'] as PaperToast;
    _loading = $['loading'] as LoadingElement;
    if (layoutType == null) {
      layoutType = layout_nav_view;
    }
  }

  static PaperToast _toastElement;

  static showError([String msg, num duration = 3000]) {
    if (_toastElement != null) {
      _toastElement.text = msg;
      _toastElement.duration = duration;
      _toastElement.toggleClass("toast-success", false);
      _toastElement.toggleClass("toast-error", true);
      _toastElement.toggle();
    }
  }

  static showSuccess([String msg, num duration = 3000]) {
    if (_toastElement != null) {
      _toastElement.text = msg;
      _toastElement.duration = duration;
      _toastElement.toggleClass("toast-success", true);
      _toastElement.toggleClass("toast-error", false);
      _toastElement.toggle();
    }
  }

  bool _isLoading;

  @property
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    loading(value);
    _isLoading = value;
    notifyPath("isLoading", value);
  }

  static LoadingElement _loading;

  static loading(bool state, [String message = null]) {
    if (_loading != null) {
      print(state);
      _loading.message = message;
      _loading.loading(state);
    }
  }

  static goToDefaultRoute([Map params]) {
    PolymerRouteBehavior.goToDefault(params);
  }

  static goToRouteName(String name, [Map params]) {
    PolymerRouteBehavior.goToName(name, params);
  }
}
