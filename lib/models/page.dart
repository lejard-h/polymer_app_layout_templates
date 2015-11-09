library polymer_app_layout.models.page;

import "dart:html";

import "package:polymer/polymer.dart";
import 'package:route_hierarchical/client.dart';

class Page extends JsProxy {
  @reflectable
  final String path;

  @reflectable
  final String name;

  @reflectable
  final dynamic element;

  @reflectable
  final bool isDefault;

  @reflectable
  final bool menu;

  @reflectable
  final hideLeftNav;

  @reflectable
  Page child;

  String toString() =>
      "{ name: $name, path: $path, element: $element, isDefault: $isDefault, menu: $menu, hideLeftNav: $hideLeftNav}";

  Page(this.name, this.path, this.element,
      {this.child: null, this.isDefault: false, this.menu: true, this.hideLeftNav: false});

  @reflectable
  enterRoute(RouteEvent e) {
    if (element != null) {
      try {
        element.enterRoute(e);
      } catch (e) {}
    }
  }
}
