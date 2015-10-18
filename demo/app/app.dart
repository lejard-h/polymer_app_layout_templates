/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("app.html")
library polymer_app_layout.example.app_demo;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_app_layout_template/app_layout.dart';

@PolymerRegister('app-demo')
class AppDemo extends PolymerElement {

    AppDemo.created() : super.created();

    List<Page> _pages;

    @property
    List<Page> get pages => _pages;

    @reflectable
    void set pages(List<Page> value) {
        _pages = value;
        notifyPath('pages', value);
    }

    ready() {
        pages = [
            new Page("Home", "home", "home-page", isDefault: true),
            new Page("One", "one", "page-one"),
            new Page("Two", "two", "page-two", menu: false)
        ];
    }

}