/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("nav_view.html")
library polymer_app_layout.layout_nav_view;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import "dart:html";

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
import 'package:polymer_route_behavior/polymer_route_behavior.dart';
import 'package:polymer_app_layout_template/behavior/toolbar_behavior.dart';

@PolymerRegister('layout-nav-view')
class LayoutNavView extends PolymerElement with PolymerRouteBehavior, ToolbarBehavior {
  LayoutNavView.created() : super.created();

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
