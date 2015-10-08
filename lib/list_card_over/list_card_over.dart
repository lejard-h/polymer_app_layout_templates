/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("list_card_over.html")
library polymer_app_layout.layout_list_card_over;

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

@PolymerRegister('layout-list-card-over')
class LayoutListCardOver extends PolymerElement {

    bool isMobile;
    String mainMode;
    String drawerWidth;
    String toolbarClass;

    LayoutListCardOver.created() : super.created();

    PaperDrawerPanel get drawerPanel => $['drawerPanel'];

    _updateAttributes() {
        set('isMobile', isMobile);
        set('mainMode', mainMode);
        set('drawerWidth', drawerWidth);
        set('toolbarClass', toolbarClass);
    }

    ready() {
        _updateAttributes();
    }

    listTap(event, _) {
       drawerPanel.closeDrawer();
    }

    @Observe('isMobile')
    isMobileChanged(isMobile) {
        mainMode = isMobile ? 'seamed' : 'cover';
        drawerWidth = isMobile ? '100%' : '320px';
        toolbarClass = isMobile ? '' : 'tall';
        _updateAttributes();
        updateStyles();
    }
}