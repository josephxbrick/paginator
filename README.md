# Paginator
Paginator is a Framer component that adds a pagination control to the specified PageComponent. A pagination control is that set of dots that show you which page you are on - common in app onboarding experiences.

![Paginator Image](/readme_images/paginator_example.png?raw=true "Paginator Image")

### Overview

Paginator has a default style for its display, which is designed to be visible on a wide variety of backgrounds, though you can customize the appearance. Once assigned to a page component, the paginator instance automatically selects the appropriate dot on page navigation, and it handles adding/removing dots when pages are added or removed from the page component.

You can also make the dots interactive. Once interactive, a dot when tapped will navigate the page component to its corresponding page.

### Usage

To add this module to your Framer project, copy the `paginator.coffee` file to the `/modules` directory of your project and include the following line in your code:

`{Paginator} = require "paginator"`

To add a paginator to the bottom a page component named `myPageComponent`:
```
New Paginator
  pageComponent: myPageComponent
  side: "bottom"
```
By default, the paginator instance will be centered horizontally on the specified side of the page component, with 10 pixels between the chosen side of the page component and the the paginator. Paginators that are added to the left or right of the the page component will be oriented verticall: the dots are situated in a vertical stack rather than in a horizontal row. 

### Other examples:
```
# Centers paginator at the top of the page component. The dots are 18 pixels in size
# and 10 pixels apart.
New Paginator
  pageComponent: myPageComponent
  dotSize: 18      # size of the dot
  dotSpacing: 10   # spacing between dots
  side: "top" 
```
```
# Centers paginator at the left of the page component. 
# The dots will be arranged vertically instead of horizontally.
New Paginator
  pageComponent: myPageComponent
  side: "left"
```
```
# Centers paginator at the right of the page component. 
# The dots will be arranged vertically instead of horizontally.
New Paginator
  pageComponent: myPageComponent
  side: "right"
```
```
# customized paginator
new Paginator
	pageComponent: myPageComponent
	side: "bottom"
	sideOffset: 12      # distance from edge
        dotSize: 28         # size of dot
	dotSpacing: 18      # spacing between dots
	interactive: true   # tap dots to navigate page component
	animOptions:        # options for animation between dots
		time: 0.25
		curve: Bezier.easeInOut
	dotDefaultProps:    # use dotDefaultProps to define the dot's normal appearance
		borderRadius: 5
		borderWidth: 2
		backgroundColor: "rgb(0, 230, 54, 0.67)" #greenish
		borderColor: "rgba(255,255,255,0.9)"
	dotSelectedProps:   # use dotSelectedProps to define what's different about the selected appearance	
		backgroundColor: "rgba(250, 5, 234, 0.67)" #pinkish
```
The example above will look like this:

![Custom Image](/readme_images/custom_example.png?raw=true "Custom Image")
  
### Default values
Following are the default property values for the Paginator class
```
New Paginator
	pageComponent: undefined  # this is a required property
	side: "bottom"
	sideOffset: 10
	dotSize: 13
	dotSpacing: 6
	dotDefaultProps: backgroundColor: "rgba(0, 0, 0, 0.15)", borderColor: "rgba(255,255,255,0.95)"
	dotSelectedProps: backgroundColor: "rgba(255,255,255,0.95)", borderColor: "rgba(0,0,0,0.35)"
	animOptions: time: 0.3, curve: Bezier.ease
	backgroundColor: ""
	interactive: false
```
  
### Framer sample
[This sample](https://framer.cloud/cNoet) contains a few examples of using Paginator.
