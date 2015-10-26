/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("nav_header.html")
library polymer_app_layout.layout_nav_header;

import "dart:html";

import 'package:polymer/polymer.dart';
import 'package:polymer_app_layout_template/behavior/toolbar_behavior.dart';
import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_route_behavior/polymer_route_behavior.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('layout-nav-header')
class LayoutNavHeader extends PolymerElement with PolymerRouteBehavior, ToolbarBehavior {
  LayoutNavHeader.created() : super.created();

  PaperDrawerPanel get drawer => $['drawerPanel'];

  @reflectable
  void menuItemClicked(event, [_]) {
    drawer.closeDrawer();
  }

  var _navHeader;

  @property
  get navHeader => _navHeader;

  @reflectable
  set navHeader(value) {
    if (value is String || value is HtmlElement) {
      _navHeader = value;
      notifyPath("navHeader", value);
    }
  }
}
