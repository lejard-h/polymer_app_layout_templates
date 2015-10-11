/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("nav_view.html")
library polymer_app_layout.layout_nav_view;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_include_element/polymer_include_element.dart';
import 'package:polymer_elements/neon_animated_pages.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:route_hierarchical/client.dart';

class ConfigLayout extends JsProxy {

  @reflectable
  final String path;

  @reflectable
  final String name;

  @reflectable
  final String element;

  @reflectable
  final bool isDefault;

  String toString() => "{ name: $name, path: $path, element: $element, isDefault: $isDefault}";

  ConfigLayout(this.name, this.path, this.element, {this.isDefault: false});
}

@PolymerRegister('layout-nav-view')
class LayoutNavView extends PolymerElement {
  LayoutNavView.created() : super.created();

  String _route;

  @property
  String get route => _route;

  @reflectable // https://github.com/dart-lang/polymer-dart/issues/621
  void set route(String newRoute) {
    _route = newRoute;
    notifyPath('route', route);
  }

  var _selectedPage;

  @property
  get selectedPage => _selectedPage;

  @reflectable // https://github.com/dart-lang/polymer-dart/issues/621
  void set selectedPage(newPage) {
    _selectedPage = newPage;
    if (newPage != null) {
      router.go(newPage["name"], {});
      routeIdx = config.indexOf(config.firstWhere((item) => item["name"] == newPage["name"]));
    }
    notifyPath('selectedPage', _selectedPage);
  }

  final Router router = new Router(useFragment: true);


  List<ConfigLayout> _config;

  @property
  List<ConfigLayout> get config => _config;

  @reflectable // https://github.com/dart-lang/polymer-dart/issues/621
  void set config(List<ConfigLayout> newConfig) {
    _config = newConfig;
    notifyPath('config', _config);
  }

  ready() {
    config.forEach((page) {
      router.root.addRoute(
          name: page["name"],
          path: page["path"],
          enter: enterRoute);
    });
    router.listen();
  }

  void enterRoute(RouteEvent e) {
    route = e.path;
    if (route != null && route.isNotEmpty) {
      selectedPage = config.firstWhere((item) => item["path"] == route);
    } else {
      selectedPage = config.firstWhere((item) => item["isDefault"] == true);
    }
  }

  String _selected;
  @property
  String get selected => _selected;
  @reflectable
  set selected(String value) => _selected = value;


  int _routeIdx;
  @Property(observer: "routeIdxChanged")
  int get routeIdx => _routeIdx;
  @reflectable // https://github.com/dart-lang/polymer-dart/issues/621
  void set routeIdx(int value) {
    _routeIdx = value;
    notifyPath('routeIdx', routeIdx);
  }

  @reflectable
  void routeIdxChanged(int newRouteIdx, [_]) {
    if (newRouteIdx >= 0 && newRouteIdx < config.length) {
      router.go(config[newRouteIdx]["name"], {});
    } else {
      routeIdx = config.indexOf(config.firstWhere((item) => item["isDefault"]));
    }
  }

}
