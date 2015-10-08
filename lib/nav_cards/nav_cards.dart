/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("nav_cards.html")
library polymer_app_layout.layout_nav_cards;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_material.dart';

@PolymerRegister('layout-nav-cards')
class LayoutNavCards extends PolymerElement {
    LayoutNavCards.created() : super.created();
}