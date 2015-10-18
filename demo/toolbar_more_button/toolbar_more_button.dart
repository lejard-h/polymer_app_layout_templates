/**
 * Created by lejard_h on 12/10/15.
 */

@HtmlImport("toolbar_more_button.html")
library walletek.web.front.elements.toolbar_more_button;

import "package:polymer/polymer.dart";
import "package:walletek_solution_front/behaviors/behaviors.dart";
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_elements/paper_menu_button.dart';
import 'package:polymer_elements/iron_dropdown.dart';
import 'package:walletek_solution_front/elements/elements.dart';
import 'dart:js' as js;


@PolymerRegister('toolbar-more-button')
class ToolbarMoreButton extends PolymerElement
    with PolymerHttpBehavior, WalletekApiBehavior, AuthBehavior {
  ToolbarMoreButton.created() : super.created();

  PaperMenuButton get button => $["button"];
  IronDropdown get dropdown => $["dropdwon"];

  @reflectable
  clickLogout(event, [_]){
    apiLogout().then((_) {
      cleanSession();
      PolymerRouteBehavior.goToName(LoginElement.name);
    });
  }

}