# polymer_app_layout_templates
Dart version of https://github.com/PolymerElements/app-layout-templates

Application Layout Templates (Dart)
============================

Use the application layout templates provided and start building responsive applications.

### [Application Layout Templates Viewer](http://polymerelements.github.io/app-layout-templates/index.html)

#### Templates:

[Left Nav + View](http://polymerelements.github.io/app-layout-templates/nav-view/index.html)

[Left Nav + Card Feed](http://polymerelements.github.io/app-layout-templates/nav-cards/index.html)

[Left Nav + List + Detail](http://polymerelements.github.io/app-layout-templates/nav-list-detail/index.html)

[List Left + Card over Extended Header](http://polymerelements.github.io/app-layout-templates/list-card-over/index.html)


### Configuration
Use [polymer_route_behavior](https://github.com/lejard-h/polymer_route_behavior) to implement routing.

Only for [Left Nav + View](http://polymerelements.github.io/app-layout-templates/nav-view/index.html) and [List Left + Card over Extended Header](http://polymerelements.github.io/app-layout-templates/list-card-over/index.html)

#### Example:
    
    
    <layout-list-card-over config='[
        { "name": "home", "path": "", "element": "home-page", "isDefault": true},
        { "name": "one", "path": "one", "element": "page-one" },
        { "name": "two", "path": "two", "element": "div" }
    ]'></layout-list-card-over>
    
The element field accept any HtmlElement.

[Working example](https://github.com/lejard-h/polymer_app_layout_templates/tree/master/example)

### Next Step

- Define and pass parameter in path url
- Add sub path