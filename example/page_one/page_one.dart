/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("page_one.html")
library polymer_app_layout.example.page_one;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/iron_media_query.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_menu.dart';

@PolymerRegister('page-one')
class PageOne extends PolymerElement {

    PageOne.created() : super.created();

}