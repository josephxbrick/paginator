# Paginator

Paginator is a Framer component that adds a pagination control to the specified PageComponent. A pagination control is that set of dots that show you which page you are on - common in app onboarding experiences.

[This sample](https://framer.cloud/VgbEW) contains a few examples of using Paginator.

<img src="/readme_images/paginator_example.gif" width="300">

Paginator has a default style for its display, which is designed to be visible on a wide variety of backgrounds, though you can customize the appearance. Once assigned to a page component, the paginator instance automatically selects the appropriate dot on page navigation, and it handles adding/removing dots when pages are added or removed from the page component.

You can also make the dots interactive. Once interactive, a dot when tapped will navigate the page component to its corresponding page.

## Getting Started

If you have Modules installed, or want to use Modules to add this module to you project, click the badge below.

<a href='https://open.framermodules.com/Paginator'>
    <img alt='Install with Framer Modules'
    src='https://www.framermodules.com/assets/badge@2x.png' width='160' height='40' />
</a>

Note that you can hit Ctrl+C in Modules (when Paginator is the active module) to copy a code example that you can then paste into your file. 

If you are not using Modules, to add this module to your Framer project copy the `paginator.coffee` file to the `/modules` directory of your project and include the following line in your code:

`{Paginator} = require "paginator"`

## Creating a Paginator

To add a paginator to the bottom of a page component named `myPageComponent`:
```
new Paginator
  pageComponent: myPageComponent
  side: "bottom"
```
Other `side` options are "top", "left", and "right". 

When "top" or "bottom" is the value for `side`, the dots will arrange themselves in a horizontal row, centered horizontally on the page component. When "left" or "right" is the value for `side`, the dots will arrange themselves in a vertical stack, centered vertically on the page component.

## Messages

### paginator.on "dotTapped", ->
If `interactive` of the paginator is set to true, the `dotTapped` event is fired when a dot is tapped.
```
paginator.on "dotTapped", (dotLayer, dotIndex) ->
```
* **dotLayer**: the layer of the tapped dot
* **dotIndex**: the zero-based index of the dot tapped

## Code Examples:
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
[This sample](https://framer.cloud/VgbEW) contains a few examples of using Paginator.
