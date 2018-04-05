class DefaultDot extends Layer
	constructor: (@o={}) ->
		_.defaults @o,
			size: 13
			borderRadius: "50%"
			borderColor: "rgba(255,255,255,0.9)"
			backgroundColor:"rgba(0, 0, 0, 0.05)"
			borderWidth: 1.1
		super @o

class exports.Paginator extends Layer
	constructor: (@o={}) ->
		_.defaults @o,
			pageComponent: undefined
			side: "bottom"
			sideOffset: 10
			dotSize: 13
			dotSpacing: 6
			dotDefaultProps: backgroundColor: "rgba(0, 0, 0, 0.15)", borderColor: "rgba(255,255,255,0.95)"
			dotSelectedProps: backgroundColor: "rgba(255,255,255,0.95)", borderColor: "rgba(0,0,0,0.35)"
			animationOptions: time: 0.3, curve: Bezier.ease
			backgroundColor: ""
			interactive: false
		super @o
		if not @pageComponent
			throw new Error "You must supply Paginator with a PageComponent"
		# for positioning to work properly, Paginator must be on same layer as is PageComponent
		@parent = @pageComponent.parent
		if @side is "top" or @side is "bottom"
			@orientation = "h"
		else if @side is "left" or @side is "right"
			@orientation = "v"
		else throw new Error "What side are you on?"

		@pageComponent.on "change:currentPage", (currentPage, target) =>
			@_selectDot target.horizontalPageIndex(currentPage)
		@pageComponent.content.on "change:children", =>
			@_layout()
		@pageComponent.on "change:size", =>
			@_setPosition()
		@pageComponent.on "change:point", =>
			@_setPosition()

		@_layout()

	_createDots: ->
		numDots = @pageComponent.content.children.length
		for i in [0...Math.max(numDots, @children.length)]
			if i >= numDots
				# Too many dots from prevous execution of _createDots().
				# (A page has been removed from the page component.)
				destroyMe = @children[i]
				destroyMe.parent = null
				destroyMe.destroy()
			if i < @children.length and i < numDots
				# Reuse existing dot from previous execution _createDots()
				# due to @pageComponent event "change:children"
				dot = @children[i]
			else if i < numDots
				# make new dot
				dot = new DefaultDot
				dot.props = @dotDefaultProps
			if i < numDots
				dot.size = @dotSize
				dot.parent = @
				if @orientation is "h"
					dot.x = i * (dot.width + @dotSpacing)
					dot.y = 0
				else
					dot.x = 0
					dot.y = i * (dot.height + @dotSpacing)
				dot.states =
					default: @dotDefaultProps
					selected: @dotSelectedProps
				if @interactive is true
					dot.onTap (event, target) =>
						@pageComponent.snapToPage @pageComponent.content.children[_.indexOf(@children, target)]
						@emit "dotTapped", target, _.indexOf(@children, target)
		if @orientation is "h"
			@width = numDots * (dot.width + @dotSpacing) - @dotSpacing
			@height = dot.height
		else
			@width = dot.width
			@height = numDots * (dot.height + @dotSpacing) - @dotSpacing

	_selectDot: (dotIndex) ->
		for child, i in @children
			if i is dotIndex
				child.animate "selected",
					@animationOptions
			else
				child.animate "default",
					@animationOptions

	_setPosition: ->
		if @oside is "bottom"
			@x = @pageComponent.x + @pageComponent.width/2 - @.width/2
			@y = @pageComponent.maxY - @height - @sideOffset
		else if @side is "top"
			@x = @pageComponent.x + @pageComponent.width/2 - @.width/2
			@y = @pageComponent.y + @sideOffset
		else if @side is "left"
			@x = @pageComponent.x + @sideOffset
			@y = @pageComponent.y + @pageComponent.height/2 - @.height/2
		else if @side is "right"
			@x = @pageComponent.maxX - @width - @sideOffset
			@y = @pageComponent.y + @pageComponent.height/2 - @.height/2

	_layout: ->
		@_createDots()
		@_selectDot _.indexOf @pageComponent.content.children, @pageComponent.currentPage
		@_setPosition()

	# To do: separate dot layout from dot creation
	# so we can dynamically set dotSize, dotSpacing, etc.
	@define "pageComponent",
		get: -> @o.pageComponent
	@define "side",
		get: -> @o.side
	@define "sideOffset",
		get: -> @o.sideOffset
	@define "dotSize",
		get: -> @o.dotSize
	@define "dotSpacing",
		get: -> @o.dotSpacing
	@define "dotDefaultProps",
		get: -> @o.dotDefaultProps
	@define "dotSelectedProps",
		get: -> @o.dotSelectedProps
	@define "interactive",
		get: -> @o.interactive
