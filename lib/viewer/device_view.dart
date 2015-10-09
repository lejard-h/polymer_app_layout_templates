/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("device_view.html")
library polymer_app_layout.layout_device_view;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('layout-device-view')
class LayoutDeviceView extends PolymerElement {
  LayoutDeviceView.created() : super.created();

  @Property(reflectToAttribute: true, notify: true)
  String src;

  @Property(reflectToAttribute: true, notify: true)
  String device = "phone";

  @Property(reflectToAttribute: true, notify: true)
  bool landscape = false;

  ready() {
  }

  toggleLandscape()  {
    landscape = !landscape;
    set('landscape', landscape);
  }

}
