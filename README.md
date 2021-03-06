# Migrating to [polymer_app](https://github.com/lejard-h/polymer_app)

# polymer_app_layout_templates
Polymer application template with responsive Material Design and routing
Use the application layout templates provided and start building responsive applications.

## [Demo](http://lejard-h.github.io/polymer_app_layout_templates/demo)

## Usage

### Define pages routing

    import 'package:polymer_app_layout_template/app_layout.dart'';
    
    // route
    @property
    List<AppPage> get pages => [
        new AppPage("Home", "home", "home-page", isDefault: true),
        new AppPage("One", "one", "page-one"),
        new AppPage("Two", "two", "page-two", menu: false, hideLeftNav: true)
    ];
    
    <layout-app 
        pages="{{pages}}" 
        layout-type="layout-nav-view">
    </layout-app>
    
### Navigate

    gotToHome() {
        LayoutApp.goToDefaultRoute();
    }

    gotToPage(String pageName) {
        LayoutApp.goToRouteName(pageName);
    }
    
### Listen route change 
    
    @Listen(LayoutApp.page_changed_event)
    pageChanged(CustomEventWrapper e, [_]) {
        print("page changed => ${(e.detail as AppPage)}");
    }
    
    @Listen(LayoutApp.path_changed_event)
    pathChanged(CustomEventWrapper e, [_]) {
        print("path changed => ${e.detail}");
    }
    
### Define Toolbar, nav-header, nav-footer
    
    // toolbar
    @property
    List get toolbarItems => [
        'toolbar-more-button' // or document.createElement('toolbar-more-button');
    ];
    
    // header
    @property
    HtmlElement get header => document.createElement("nav-header");
    
    //footer
    @property
    String get footer => "nav-footer"
       
    
    <layout-app 
        pages="{{pages}}" 
        toolbar-items="{{toolbarItems}}" 
        layout-type="layout-nav-header" 
        nav-header="{{header}}" 
        nav-footer="{{footer}}">
    </layout-app>
 
  
The element field accept any HtmlElement.

[Working example](https://github.com/lejard-h/polymer_app_layout_templates/tree/master/demo)

## Templates

[Left Nav + View](http://polymerelements.github.io/app-layout-templates/nav-view/index.html)

[List Left + Card over Extended Header](http://polymerelements.github.io/app-layout-templates/list-card-over/index.html)


## Next Step

- Define and pass parameter in path url
