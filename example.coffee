pc = new PageComponent
	width: Screen.width - 40
	height: Screen.height - 40
	borderRadius: 15
	point: Align.center
	scrollVertical: false
for i in [0...5]
	layer = new Layer
		size: pc.size
		image: Utils.randomImage()
		borderRadius: pc.borderRadius
		x: i * (pc.width + 10)
		parent: pc.content
paginator = new Paginator
	pageComponent: pc
	side: "bottom"
	dotSize: 14
	dotSpacing: 6
	sideOffset: 12
