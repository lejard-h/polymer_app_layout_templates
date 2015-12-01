library polymer_app_layout.models.page;

import "dart:html";

import "package:polymer/polymer.dart";
import 'package:route_hierarchical/client.dart';

class AppPage extends JsProxy {

  /// path of the page
  @reflectable
  final String path;

  /// name of the page
  @reflectable
  final String name;

  /// element of the page
  /// Can be an [HtmlElement] or the element name as a [String]
  @reflectable
  dynamic element;

  /// definne if page is default, home
  @reflectable
  final bool isDefault;

  /// define if page is visible in the menu
  @reflectable
  final bool menu;

  /// define if the left menu is hide for this page
  @reflectable
  final hideLeftNav;

  /// define polymer material icon for the page
  @reflectable
  dynamic icon;

  /// link to the sub page
  @reflectable
  AppPage child;

  String toString() =>
      "{ name: $name, path: $path, element: $element, isDefault: $isDefault, menu: $menu, hideLeftNav: $hideLeftNav, icon: $icon}";

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

  AppPage(this.name, this.path, _element, {this.isDefault: false, this.menu: true, this.hideLeftNav: false, this.icon, this.child: null}) {
    if (icon is String || icon is HtmlElement) {
      this.icon = icon;
    } else {
      this.icon = null;
    }
    if (_element is String) {
      element = document.createElement(_element);
    } else if (_element is HtmlElement) {
      element = _element;
    } else {
      throw "Page : element must be String or HtmlElement.";
    }
    this.child = child;
  }
}
