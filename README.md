# polymer_app_layout_templates
Dart version of https://github.com/PolymerElements/app-layout-templates + routing

Application Layout Templates (Dart)
============================

Use the application layout templates provided and start building responsive applications.

### [Application Layout Templates Viewer](http://polymerelements.github.io/app-layout-templates/index.html)

#### Templates:

[Left Nav + View](http://polymerelements.github.io/app-layout-templates/nav-view/index.html)

[Left Nav + Card Feed](http://polymerelements.github.io/app-layout-templates/nav-cards/index.html)

[Left Nav + List + Detail](http://polymerelements.github.io/app-layout-templates/nav-list-detail/index.html)

[List Left + Card over Extended Header](http://polymerelements.github.io/app-layout-templates/list-card-over/index.html)


### Usage
Use [polymer_route_behavior](https://github.com/lejard-h/polymer_route_behavior) to implement routing.

Available for: 
 - [Left Nav + View](http://polymerelements.github.io/app-layout-templates/nav-view/index.html)
 - [List Left + Card over Extended Header](http://polymerelements.github.io/app-layout-templates/list-card-over/index.html)
 - Layout Nav Header 

#### Example:

awesome_polymer_element.dart:

    import 'package:polymer_route_behavior/polymer_route_behavior.dart';
    
    ...
    pages = [
                new Page("Home", "home", "home-page", isDefault: true),
                new Page("One", "one", "page-one"),
                new Page("Two", "two", "page-two", menu: false)
            ];
    ...
    
awesome_polymer_element.html:
    
    <layout-nav-header pages='{{pages}}'></layout-list-card-over>
    
The element field accept any HtmlElement.

[Working example](https://github.com/lejard-h/polymer_app_layout_templates/tree/master/demo)

### Next Step

- Configure toolbar
- Define and pass parameter in path url
- Add sub path
