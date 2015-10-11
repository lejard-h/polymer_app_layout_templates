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
import 'package:polymer_route_behavior/polymer_route_behavior.dart';

@PolymerRegister('layout-list-card-over')
class LayoutListCardOver extends PolymerElement with PolymerRouteBehavior {
  bool _isMobile;
  String _mainMode;
  String _drawerWidth;
  String _toolbarClass;

  @property
  String get toolbarClass => _toolbarClass;

  @reflectable
  set toolbarClass(String value) {
    _toolbarClass = value;
    notifyPath("toolbarClass", value);
  }

  @property
  String get drawerWidth => _drawerWidth;

  @reflectable
  void set drawerWidth(String value) {
    _drawerWidth = value;
    notifyPath("drawerWidth", value);
  }

  @property
  bool get isMobile => _isMobile;

  @reflectable
  void set isMobile(bool value) {
    _isMobile = value;
    notifyPath("isMobile", value);
  }

  @property
  String get mainMode => _mainMode;

  @reflectable
  void set mainMode(String value) {
    _mainMode = value;
    notifyPath("mainMode", value);
  }

  LayoutListCardOver.created() : super.created();

  PaperDrawerPanel get drawerPanel => $['drawerPanel'];

  ready() {
    initRouter();
  }

  listTap(event, _) {
    drawerPanel.closeDrawer();
  }

  @Observe("_isMobile")
  isMobileChanged(bool newValue) {
    mainMode = newValue ? 'seamed' : 'cover';
    drawerWidth = newValue ? '100%' : '320px';
    toolbarClass = newValue ? '' : 'tall';
    updateStyles();
  }
}
