/**
 * Created by lejard_h on 11/10/15.
 */

library polymer_app_layout.behaviors.route_behavior;

import 'dart:html';

import "package:polymer/polymer.dart";
import 'package:route_hierarchical/client.dart';
import "package:polymer_app_layout_template/models/models.dart";

@behavior
abstract class PolymerRouteBehavior {

  /// [Router] Instance.
  static Router router;

  static String defaultPathName;

  /// Event send when the current path change
  /// Event detail is a [String]
  static const String path_changed_event = "current-path-changed";


  /// Event send when the current page change.
  /// The page is send in event detail.
  static const String page_changed_event = "current-page-changed";

  List<AppPage> _visiblePagesMenu;
  List<AppPage> _childPages;
  List<AppPage> _pages;
  AppPage _selectedPage;
  int _visibleMenuIdx;
  String _currentPath;
  String _currentName;
  int _routeIdx;
  bool _useFragment = true;

  /// Go to the default AppPage
  @reflectable
  static goToDefault([Map params]) {
    if (params == null) {
      params = new Map();
    }
    if (defaultPathName != null) {
      router.go(defaultPathName, params);
    }
  }

  /// Go to the page corresponding to the name
  @reflectable
  static goToName(String name, [Map params]) {
    if (params == null) {
      params = new Map();
    }
    router.go(name, params);
  }

  resetRoute() {
    router = new Router(useFragment: useFragment);
    _visiblePagesMenu = new List<AppPage>();
    _childPages = new List<AppPage>();
    if (pages != null) {
      pages.forEach((page) {
        router.root.addRoute(name: page.name, path: page.path, defaultRoute: page.isDefault, enter: enterRoute);
        AppPage _page = page;
        while (_page != null && _page.child != null) {
          _page = _page.child;
          _childPages.add(_page);
          router.root.addRoute(name: _page.name, path: _page.path, /*defaultRoute: _page.isDefault,*/ enter: enterRoute);
        }
        if (page.menu && page.element != null) {
          _visiblePagesMenu.add(page);
        }
        if (page.isDefault && page.element != null) {
          defaultPathName = page.name;
        }
      });
    }
    notifyPath('visiblePagesMenu', _visiblePagesMenu);
    router.listen();
  }

  void enterRoute(RouteEnterEvent e) {
    if (e.route.name != _currentName && currentPath != e.path) {
      if (e.path != null && e.path.isNotEmpty) {
        _currentName = e.route.name;
        currentPath = e.path;
        try {
          selectedPage = pages.firstWhere((item) => isSamePath(item.path, e.path));
          selectedPage.enterRoute(e);
          fire(page_changed_event, detail: selectedPage);
        } catch (e) {
          print(e);
        }
      } else {
        goToDefault();
      }
    }
  }

  /*
  Getter
   */

  @property
  bool get useFragment => _useFragment;


  /// Current Path
  String get currentPath => _currentPath;

  @property
  List<AppPage> get visiblePagesMenu => _visiblePagesMenu;

  /// Current AppPage
  @property
  AppPage get selectedPage => _selectedPage;

  /// Pages config
  @property
  List<AppPage> get pages => _pages;

  @property
  int get routeIdx => _routeIdx;

  @property
  int get visibleMenuIdx => _visibleMenuIdx;
  ///////////////////

  /*
  Setter
   */

  void set useFragment(value) {
    _useFragment = value;
    notifyPath('useFragment', value);
  }

  void set visiblePagesMenu(List<AppPage> newConfig) {
    _visiblePagesMenu = newConfig;
    notifyPath('visiblePagesMenu', _visiblePagesMenu);
  }

  void set pages(List<AppPage> newConfig) {
    _pages = newConfig;
    resetRoute();
    notifyPath('config', _pages);
  }

  set currentPath(value) {
    if (value != _currentPath) {
      _currentPath = value;
      fire(path_changed_event, detail: value);
    }
  }

  void set visibleMenuIdx(int value) {
    _visibleMenuIdx = value;
    if (value >= 0 && value < visiblePagesMenu.length) {
      router.go(visiblePagesMenu[value].name, {});
    }
    notifyPath('visibleMenuIdx', _visibleMenuIdx);
  }

  void set routeIdx(int value) {
    _routeIdx = value;
    try {
      _visibleMenuIdx = visiblePagesMenu.indexOf(visiblePagesMenu.firstWhere((item) => item.name == _currentName));
    } catch (e) {
      visibleMenuIdx = -1;
    }
    notifyPath('visibleMenuIdx', _visibleMenuIdx);
    notifyPath('routeIdx', _routeIdx);
  }

  void set selectedPage(AppPage value) {
    if (value != null && _selectedPage != value) {
      routeIdx = pages.indexOf(pages.firstWhere((item) => isSamePath(item.path, value.path) && item.element != null));
    }
    _selectedPage = value;
    notifyPath('selectedPage', _selectedPage);
  }
  ///////////////////

  bool isSamePath(String a, String b) => a != null && b != null && a.split("/")[0] == b.split("/")[0];
}
