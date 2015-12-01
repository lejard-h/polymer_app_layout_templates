/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("theme.html")
@HtmlImport("app.html")
library polymer_app_layout.example.app_demo;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_app_layout_template/app_layout.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_menu_button.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_item.dart';

@PolymerRegister('app-demo')
class AppDemo extends PolymerElement {
  AppDemo.created() : super.created();

  @property
  List<AppPage> get pages => [
        new AppPage("Home", "home", "home-page", isDefault: true),
        new AppPage("One", "one", "page-one"),
        new AppPage("Two", "two", "page-two", menu: false)
      ];

  @property
  List get toolbarItems => [
        'toolbar-more-button' // or document.createElement('toolbar-more-button');
      ];

  @Listen(LayoutApp.page_changed_event)
  pageChanged(CustomEventWrapper e, [_]) {
    print("page changed => ${(e.detail as AppPage)}");
  }

  @Listen(LayoutApp.path_changed_event)
  pathChanged(CustomEventWrapper e, [_]) {
    print("path changed => ${e.detail}");
  }

  gotToHome() {
    LayoutApp.goToDefaultRoute();
  }

  gotToPage(String pageName) {
    LayoutApp.goToRouteName(pageName);
  }
}
