/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("nav_list_detail.html")
library polymer_app_layout.layout_nav_list_detail;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_include_element/polymer_include_element.dart';

@PolymerRegister('layout-nav-list-detail')
class LayoutNavListDetail extends PolymerElement {
    LayoutNavListDetail.created() : super.created();

    PaperDrawerPanel get mainDrawerPanel => $['mainDrawerPanel'];

    @reflectable
    computeListWidth(isMobile) {
        // when in mobile screen size, make the list be 100% width to cover the whole screen
        return isMobile ? '100%' : '33%';
    }

    @reflectable
    listTap(event, _) {
        mainDrawerPanel.closeDrawer();
    }

    List _toolbarButtons;

    @property
    List get toolbarButtons => _toolbarButtons;

    @reflectable
    set toolbarButtons(Listvalue) {
        _toolbarButtons = value;
        notifyPath("toolbarButtons", _toolbarButtons);
    }

}