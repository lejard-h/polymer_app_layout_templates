/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("nav-view.html")
library polymer_app_layout.layout_nav_view;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_toolbar.dart';

@PolymerRegister('layout-nav-view')
class LayoutNavView extends PolymerElement {
  LayoutNavView.created() : super.created();
}
