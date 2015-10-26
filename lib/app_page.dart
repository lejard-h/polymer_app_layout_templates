library polymer_app_layout.app_page;

import "dart:html";

import "package:polymer/polymer.dart";
import "package:polymer_route_behavior/polymer_route_behavior.dart";

class AppPage extends Page {
  @reflectable
  dynamic icon;

  AppPage(name, path, element, {isDefault: false, menu: true, hideLeftNav: false, icon})
      : super(name, path, element, isDefault: isDefault, menu: menu, hideLeftNav: hideLeftNav) {
    if (icon is String || icon is HtmlElement) {
      this.icon = icon;
    } else {
      this.icon = null;
    }
  }

  String toString() =>
      "{ name: $name, path: $path, element: $element, isDefault: $isDefault, menu: $menu, hideLeftNav: $hideLeftNav, icon: $icon}";
}
