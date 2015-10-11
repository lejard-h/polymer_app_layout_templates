/**
 * Created by lejard_h on 11/10/15.
 */

import "package:polymer/polymer.dart";
import 'package:route_hierarchical/client.dart';

class Page extends JsProxy {

  @reflectable
  final String path;

  @reflectable
  final String name;

  @reflectable
  final String element;

  @reflectable
  final bool isDefault;

  String toString() =>
      "{ name: $name, path: $path, element: $element, isDefault: $isDefault}";

  Page(this.name, this.path, this.element, {this.isDefault: false});
}

@behavior
abstract class PolymerRouteBehavior {

  List<Page> _config;

  @property
  List<Page> get config => _config;

  @reflectable // https://github.com/dart-lang/polymer-dart/issues/621
  void set config(List<Page> newConfig) {
    _config = newConfig;
    notifyPath('config', _config);
  }

  final Router router = new Router(useFragment: true);

  initRouter() {
    config.forEach((page) {
      router.root.addRoute(
          name: page["name"],
          path: page["path"],
          defaultRoute: page["isDefault"],
          enter: enterRoute);
    });
    router.listen();
  }

  ready() {
   initRouter();
  }

  String _route;

  @property
  String get route => _route;

  @reflectable // https://github.com/dart-lang/polymer-dart/issues/621
  void set route(String newRoute) {
    _route = newRoute;
    notifyPath('route', route);
  }

  void enterRoute(RouteEvent e) {
    route = e.path;
    if (route != null && route.isNotEmpty) {
      selectedPage = config.firstWhere((item) => item["path"] == route);
    } else {
      selectedPage = config.firstWhere((item) => item["isDefault"] == true);
    }
  }

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

  Page _selectedPage;

  @property
  Page get selectedPage => _selectedPage;

  @reflectable
  void set selectedPage(newPage) {
    _selectedPage = newPage;
    if (newPage != null) {
      router.go(newPage["name"], {});
      routeIdx = config.indexOf(
          config.firstWhere((item) => item["name"] == newPage["name"]));
    }
    notifyPath('selectedPage', _selectedPage);
  }
}