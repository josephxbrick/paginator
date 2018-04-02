accordion = new Accordion
	width: Screen.width - 20
	x: Align.center
	y: 10
	singleExpand: true
for i in [0...5]
	layer = new Layer
		width: accordion.width
		height: 50
		backgroundColor: Utils.randomColor()
	button = new Layer #create expansion button (optional)
		parent: layer
		size: 30
		x: 10
		backgroundColor: "#222222"
		blending: Blending.overlay
		y: Align.center
	accordion.addItem layer, 200, 50, button
