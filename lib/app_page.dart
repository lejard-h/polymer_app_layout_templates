part of polymer_app_layout;

class AppPage extends Page {
  @reflectable
  dynamic icon;

  AppPage(name, path, element, {isDefault: false, menu: true, icon})
      : super(name, path, element, isDefault: isDefault, menu: menu) {
    if (icon is String || icon is HtmlElement) {
      this.icon = icon;
    } else {
      this.icon = null;
    }
  }

  String toString() =>
      "{ name: $name, path: $path, element: $element, isDefault: $isDefault, menu: $menu, icon: $icon}";
}
