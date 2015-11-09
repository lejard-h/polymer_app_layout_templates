# polymer_app_layout_templates
Polymer application template with responsive Material Design and routing

Use the application layout templates provided and start building responsive applications.

## Usage
Use [polymer_route_behavior](https://github.com/lejard-h/polymer_route_behavior) to implement routing.

awesome_polymer_element.dart:

    import 'package:polymer_app_layout_template/app_layout.dart'';
    
    ...
    
    // route
    @property
    List<Page> get pages => [
        new Page("Home", "home", "home-page", isDefault: true),
        new Page("One", "one", "page-one"),
        new Page("Two", "two", "page-two", menu: false)
    ];
    
    ...
    
    // toolbar
    @property
    List get toolbarItems => [
        'toolbar-more-button' // or document.createElement('toolbar-more-button');
    ];
    
    ...
    
    @Listen(PolymerRouteBehavior.page_changed_event)
    pageChanged(CustomEventWrapper e, [_]) {
        print("page changed => ${(e.detail as Page)}");
    }
    
    @Listen(PolymerRouteBehavior.path_changed_event)
    pathChanged(CustomEventWrapper e, [_]) {
        print("path changed => ${e.detail}");
    }
    
    gotToHome() {
        PolymerRouteBehavior.goToDefault();
    }
    
    gotToPage(String pageName) {
        PolymerRouteBehavior.goToName(pageName);
    }
    
    ...
    
awesome_polymer_element.html:
    
     <layout-app pages="{{pages}}" toolbar-items="{{toolbarItems}}" layout-type="layout-nav-header"></layout-app>
    
The element field accept any HtmlElement.

[Working example](https://github.com/lejard-h/polymer_app_layout_templates/tree/master/demo)

## Templates:

[Left Nav + View](http://polymerelements.github.io/app-layout-templates/nav-view/index.html)

[List Left + Card over Extended Header](http://polymerelements.github.io/app-layout-templates/list-card-over/index.html)


## Next Step

- Define and pass parameter in path url
