/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("nav_header.html")
library polymer_app_layout.elements.layout_nav_header;

import 'package:polymer/polymer.dart';
import 'package:polymer_app_layout_template/behaviors/behaviors.dart';
import 'package:polymer_app_layout_template/elements/elements.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('layout-nav-header')
class LayoutNavHeader extends PolymerElement with PolymerRouteBehavior, ToolbarBehavior, LeftNavBehavior, IconBehavior {
  LayoutNavHeader.created() : super.created();
}
