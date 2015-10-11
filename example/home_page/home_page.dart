/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("home_page.html")
library polymer_app_layout.example.home_page;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/paper_material.dart';

@PolymerRegister('home-page')
class HomePage extends PolymerElement {

    HomePage.created() : super.created();

}