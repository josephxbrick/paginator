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
			animOptions: time: 0.3, curve: Bezier.ease
			backgroundColor: ""
			interactive: false
		super @o
		@_pc = @o.pageComponent
		if not @_pc
			throw new Error "You must supply Paginator with a PageComponent"
		# for positioning to work properly, Paginator must be on same layer as is PageComponent
		@parent = @_pc.parent
		if @o.side is "top" or @o.side is "bottom"
			@orientation = "h"
		else if @o.side is "left" or @o.side is "right"
			@orientation = "v"
		else throw new Error "What side are you on?"

		me = @
		@_pc.on "change:currentPage", ->
			me.selectDot @horizontalPageIndex(@currentPage)
		@_pc.content.on "change:children", =>
			@layout()
		@layout()

	createDots: ->
		numDots = @_pc.content.children.length
		for i in [0...Math.max(numDots, @children.length)]
			if i >= numDots
				# Too many dots from prevous execution of createDots().
				# (A page has been removed from the page component.)
				destroyMe = @children[i]
				destroyMe.parent = null
				destroyMe.destroy()
			if i < @children.length and i < numDots
				# Reuse existing dot from previous execution createDots()
				# due to @_pc event "change:children"
				dot = @children[i]
			else if i < numDots
				# make new dot
				dot = new DefaultDot
				dot.props = @o.dotDefaultProps
			if i < numDots
				dot.size = @o.dotSize
				dot.parent = @
				if @orientation is "h"
					dot.x = i * (dot.width + @o.dotSpacing)
					dot.y = 0
				else
					dot.x = 0
					dot.y = i * (dot.height + @o.dotSpacing)
				dot.states =
					default: @o.dotDefaultProps
					selected: @o.dotSelectedProps
				if @o.interactive is true
					dot.onTap (event) ->
						@parent._pc.snapToPage @parent._pc.content.children[_.indexOf(@parent.children, @)]
						@emit "dot:tapped", {layer: @, index: _.indexOf(parent.children, 0)}
		if @orientation is "h"
			@width = numDots * (dot.width + @o.dotSpacing) - @o.dotSpacing
			@height = dot.height
		else
			@width = dot.width
			@height = numDots * (dot.height + @o.dotSpacing) - @o.dotSpacing

	selectDot: (dotIndex) ->
		for child, i in @children
			if i is dotIndex
				child.animate "selected",
					@o.animOptions
			else
				child.animate "default",
					@o.animOptions

	setPosition: ->
		if @o.side is "bottom"
			@x = @_pc.x + @_pc.width/2 - @.width/2
			@y = @_pc.maxY - @height - @o.sideOffset
		else if @o.side is "top"
			@x = @_pc.x + @_pc.width/2 - @.width/2
			@y = @_pc.y + @o.sideOffset
		else if @o.side is "left"
			@x = @_pc.x + @o.sideOffset
			@y = @_pc.y + @_pc.height/2 - @.height/2
		else if @o.side is "right"
			@x = @_pc.maxX - @width - @o.sideOffset
			@y = @_pc.y + @_pc.height/2 - @.height/2

	layout: ->
		@createDots()
		@selectDot _.indexOf @_pc.content.children, @_pc.currentPage
		@setPosition()
