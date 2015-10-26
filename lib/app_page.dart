library polymer_app_layout.app_page;

import "dart:html";

import "package:polymer/polymer.dart";
import "package:polymer_route_behavior/polymer_route_behavior.dart";

class AppPage extends Page {
  @reflectable
  dynamic icon;

  @reflectable
  AppPage child;

  AppPage(name, path, element, {isDefault: false, menu: true, hideLeftNav: false, icon, child: null})
      : super(name, path, element, isDefault: isDefault, menu: menu, hideLeftNav: hideLeftNav, child: child) {
    if (icon is String || icon is HtmlElement) {
      this.icon = icon;
    } else {
      this.icon = null;
    }
    this.child = child;
  }

  String toString() =>
      "{ name: $name, path: $path, element: $element, isDefault: $isDefault, menu: $menu, hideLeftNav: $hideLeftNav, icon: $icon}";
}
