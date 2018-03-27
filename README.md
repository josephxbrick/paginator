# paginator
A Framer component that adds a pagination control (those little dots that show which page you are on) to the specified PageComponent.

### Overview

Paginator has a default style its display of the pagination dots, though you can customize the appearance. Once assigned to a page component, the paginator instance automatically selects its proper dot on page navigation, and it handles adding/removing dots to/from itself when pages are added or removed from the page component.

You can also make the dots interactive. Once interactive, a dot when tapped in the paginator instance will navigate the page component to its corresponding page.

### Usage

To add this module to your Framer project, copy the `paginator.coffee` file to the `/modules` directory of your project and include the following line in your code:

`{Paginator} = require "paginator"`

To add a paginator to the bottom a page component named myPageComponent:
```
New Paginator
  pageComponent: myPageComponent
  side: "bottom"
```
By default, the paginator instance will be centered horizontally relative to the page component, with 10 pixels between the bottom of the page component and the bottom of the paginator.

##### Other sides:
```
# Centers paginator at the top of the page component.
New Paginator
  pageComponent: myPageComponent
  side: "top" 
```
```
# Centers paginator at the left of the page component. 
# The dots will be arranged vertically instead of horizontally
New Paginator
  pageComponent: myPageComponent
  side: "left"
```
```
# Centers paginator at the right of the page component. 
# The dots will be arranged vertically instead of horizontally
New Paginator
  pageComponent: myPageComponent
  side: "right"
```




