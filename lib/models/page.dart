library polymer_app_layout.models.page;

import "dart:html";

import "package:polymer/polymer.dart";
import 'package:route_hierarchical/client.dart';

class Page extends JsProxy {

  /// path of the page
  @reflectable
  final String path;

  /// name of the page
  @reflectable
  final String name;

  /// element of the page
  /// Can be an [HtmlElement] or the element name as a [String]
  @reflectable
  final dynamic element;

  /// definne if page is default, home
  @reflectable
  final bool isDefault;

  /// define if page is visible in the menu
  @reflectable
  final bool menu;

  /// define if the left menu is hide for this page
  @reflectable
  final hideLeftNav;

  /// link to the sub page
  @reflectable
  Page child;

  String toString() =>
      "{ name: $name, path: $path, element: $element, isDefault: $isDefault, menu: $menu, hideLeftNav: $hideLeftNav}";

  /// When enter in a new route.
  /// This function call the enterRoute function of the current element if it's possible.
  @reflectable
  enterRoute(RouteEvent e) {
    if (element != null) {
      try {
        element.enterRoute(e);
      } catch (e) {}
    }
  }

  Page(this.name, this.path, this.element,
      {this.child: null, this.isDefault: false, this.menu: true, this.hideLeftNav: false});
}
