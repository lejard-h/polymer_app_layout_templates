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

  static PaperToast _toast;

  static showError([String msg, num duration = 3000]) {
    if (_toast != null) {
      _toast.text = msg;
      _toast.duration = duration;
      _toast.toggleClass("toast-success", false);
      _toast.toggleClass("toast-error", true);
      _toast.toggle();
    }
  }

  static showSuccess([String msg, num duration = 3000]) {
    if (_toast != null) {
      _toast.text = msg;
      _toast.duration = duration;
      _toast.toggleClass("toast-success", true);
      _toast.toggleClass("toast-error", false);
      _toast.toggle();
    }
  }

  static LoadingElement _loading;

  static loading(bool state, [String message = null]) {
   if (_loading != null) {
      _loading.message = message;
     _loading.loading(state);
   }
  }

  var _navHeader;
  var _navFooter;
  String _layoutType;
  HtmlElement _layout;
  List<AppPage> _pages;
  List _toolbarItems;

  /// Define the element to show in the nav Header.
  /// Can be an [HtmlElement] or the element name as a [String].
  @property
  get navHeader => _navHeader;

  set navHeader(value) {
    if (value is String || value is HtmlElement) {
      _navHeader = value;
      notifyPath("navHeader", value);
    }
  }

  /// Define the element to show in the nav Footer.
  /// Can be an [HtmlElement] or the element name as a [String].
  @property
  get navFooter => _navFooter;

  set navFooter(value) {
    if (value is String || value is HtmlElement) {
      _navFooter = value;
      notifyPath("navFooter", value);
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

  _layoutIsValid(value) => (value == layout_nav_view || value == layout_list_card_over || value == layout_nav_header);

  _setLayout() {
    if (_layoutIsValid(layoutType)) {
      _layout = document.createElement(layoutType);
      _setPages(pages);
      _setToolbarItems(toolbarItems);
      _setNavHeader(navHeader);
      _setNavFooter(navFooter);
      include(_layout, $['container']);
      notifyPath("layout", _layout);
    }
  }

  ready() {
    _toast = $['toast'] as PaperToast;
    _loading = $['loading'] as LoadingElement;
    if (layoutType == null) {
      layoutType = layout_nav_view;
    }
  }
}
