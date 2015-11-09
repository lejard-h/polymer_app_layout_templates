/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("nav_view.html")
library polymer_app_layout.elements.layout_nav_view;

import 'package:polymer/polymer.dart';
import 'package:polymer_app_layout_template/behaviors/behaviors.dart';
import 'package:polymer_app_layout_template/elements/elements.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('layout-nav-view')
class LayoutNavView extends PolymerElement with PolymerRouteBehavior, ToolbarBehavior, LeftNavBehavior, IconBehavior {
  LayoutNavView.created() : super.created();
}
