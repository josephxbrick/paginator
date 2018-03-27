# paginator
A Framer component that adds a pagination control to the specified PageComponent. A paginator is that set of dots that show you which page you are on - common in app onboarding experiences.

![Paginator Image](/readme_images/paginator_example.png?raw=true "Paginator Image")

### Overview

Paginator has a default style for its display of the pagination dots, which is designed to be visible on a wide variety of backgrounds, though you can customize the appearance. Once assigned to a page component, the paginator instance automatically selects its proper dot on page navigation, and it handles adding/removing dots to/from itself when pages are added or removed from the page component.

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

##### Other examples:
```
# Centers paginator at the top of the page component. The dots are 18 pixels in size
# and 10 pixels apart.
New Paginator
  pageComponent: myPageComponent
  dotSize: 18
  dotSpacing: 10
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




