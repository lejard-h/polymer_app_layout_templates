/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("device_layout_viewer.html")
library polymer_app_layout.device_layout_viewer;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:convert';
import 'package:web_components/web_components.dart' show HtmlImport;

import 'package:polymer_app_layout_template/viewer/device_view.dart';

import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/hardware_icons.dart';
import 'package:polymer_elements/iron_selector.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/color.dart';
import 'package:polymer_elements/shadow.dart';
import 'package:polymer_elements/paper_toggle_button.dart';

class Source extends JsProxy {

  @reflectable
  String name;

  @reflectable
  String src;

  @reflectable
  String github;

  Source(this.name, this.src, this.github);

  toString() => "{ name: $name , src: $src, github: $github }";

}

@PolymerRegister('device-layout-viewer')
class DeviceLayoutViewer extends PolymerElement {
  DeviceLayoutViewer.created() : super.created();

  @Property(reflectToAttribute: true, observer: 'sourcesChanged')
  List sources;

  @Property(notify: true)
  String device = "phone";

  @Property(notify: true, observer: "showAllChanged")
  bool showAll = true;

  @Property(notify: true)
  bool hideSidebar;

  IronIcon deviceIcon;
  DeviceLayoutViewer deviceView;

  @reflectable
  Source source;

  SelectElement get select => $['select'];

  _updateAttributes() {
    set('showAll', showAll);
    set('device', device);
    set('hideSidebar', hideSidebar);
    set('deviceIcon', deviceIcon);
    set('deviceView', deviceView);
    set('sources', sources);
    set('source', source);
    updateStyles();
  }

  ready() {
    _updateAttributes();
  }

  @reflectable
  showAllChanged(newValue, oldValue) {
    updateStyles();
  }

  @reflectable
  sourcesChanged(List newSources, oldSources) {
    select.text = "";
    sources.forEach((var s) {
      select.add(new OptionElement(data: s['name']), -1);
    });
    set('source', new Source(sources[0]["name"], sources[0]["src"], sources[0]["github"]));
  }

  @Listen('on-change')
  selectChange(e, _) {
    set('source', new Source(sources[e.target.selectedIndex]["name"], sources[e.target.selectedIndex]["src"], sources[e.target.selectedIndex]["github"]));
  }

  @reflectable
  onIconActivate(e, _) {
    IronIcon icon = e.detail["item"] as IronIcon;
    if (icon == deviceIcon) {
      toggleLandscape();
    }
    _updateAttributes();
  }

  toggleLandscape() {
    deviceIcon.classes.toggle('landscape');
    deviceView.toggleLandscape();
    _updateAttributes();
  }

}
