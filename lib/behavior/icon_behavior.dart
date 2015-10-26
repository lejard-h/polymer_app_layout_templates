/**
 * Created by lejard_h on 18/10/15.
 */

library polymer_app_layout.icon_behavior;

import "dart:html";

import 'package:polymer/polymer.dart';
import '../app_layout.dart';

@behavior
abstract class IconBehavior {
  @reflectable
  bool isIconString(AppPage page) {
    try {
      return page.icon is String;
    } catch (e) {
      return false;
    }
  }

  @reflectable
  bool isIconHtmlElement(AppPage page) {
    try {
      return page.icon is HtmlElement;
    } catch (e) {
      return false;
    }
  }
}
