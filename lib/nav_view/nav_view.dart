/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("nav_view.html")
library polymer_app_layout.layout_nav_view;

import "dart:html";

import 'package:polymer/polymer.dart';
import 'package:polymer_app_layout_template/app_layout.dart';
import 'package:polymer_app_layout_template/behavior/toolbar_behavior.dart';
import 'package:polymer_app_layout_template/behavior/left_nav_behavior.dart';
import 'package:polymer_app_layout_template/behavior/icon_behavior.dart';
import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_route_behavior/polymer_route_behavior.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('layout-nav-view')
class LayoutNavView extends PolymerElement with PolymerRouteBehavior, ToolbarBehavior, LeftNavBehavior, IconBehavior {
  LayoutNavView.created() : super.created();
}
