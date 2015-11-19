/**
 * Created by lejard_h on 08/10/15.
 */

@HtmlImport("loading_element.html")
library polymer_app_layout.elements.elements.loading_element;

import "package:polymer/polymer.dart";
import 'package:web_components/web_components.dart' show HtmlImport;
import 'dart:html';

@PolymerRegister('loading-element')
class LoadingElement extends PolymerElement {

  LoadingElement.created() : super.created();

  HtmlElement get rootElement  => $['main'];

  loading(bool state) {
    if (state != _isLoading) {
      if (state && (rootElement.style.getPropertyValue("display") == "none" || rootElement.style.getPropertyValue("display").isEmpty)) {
        rootElement.style.setProperty("display", "flex");
      } else if (!state && rootElement.style.getPropertyValue("display") != "none") {
        rootElement.style.setProperty("display", "none");
      }
      _isLoading = state;
      notifyPath("isLoading", state);
    }
  }

  bool _isLoading;

  @property
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    loading(value);
  }

  String _message;

  @property
  String get message => _message;

  set message(String value) {
    _message = value;
    notifyPath("message", value);
  }


}
