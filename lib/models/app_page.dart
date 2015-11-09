library polymer_app_layout.models.app_page;

import "dart:html";

import "package:polymer/polymer.dart";
import "page.dart";

class AppPage extends Page {
  /// define polymer material icon for the page
  @reflectable
  dynamic icon;

  /// link to the sub page
  @reflectable
  AppPage child;

  String toString() =>
      "{ name: $name, path: $path, element: $element, isDefault: $isDefault, menu: $menu, hideLeftNav: $hideLeftNav, icon: $icon}";

  AppPage(name, path, element, {isDefault: false, menu: true, hideLeftNav: false, icon, child: null})
      : super(name, path, element, isDefault: isDefault, menu: menu, hideLeftNav: hideLeftNav, child: child) {
    if (icon is String || icon is HtmlElement) {
      this.icon = icon;
    } else {
      this.icon = null;
    }
    this.child = child;
  }
}
