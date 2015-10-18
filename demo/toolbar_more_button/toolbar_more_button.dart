/**
 * Created by lejard_h on 12/10/15.
 */

@HtmlImport("toolbar_more_button.html")
library polymer_app_layout.example.toolbar_more_button;

import "package:polymer/polymer.dart";
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/paper_menu_button.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_item.dart';
import 'dart:html';

@PolymerRegister('toolbar-more-button')
class ToolbarMoreButton extends PolymerElement {
  ToolbarMoreButton.created() : super.created();

  @reflectable
  clickMenu(event, [_]) {
    window.alert("Awesome !!!");
  }
}
