package art;

/**
 * short description what this does
 */
class CC042 extends CCBase implements ICCBase {

	var shapeArray : Array<Circle> = [];
	var grid : GridUtil = new GridUtil();
	// sizes
	var _radius = 150;
	var _cellsize = 150;
	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;

	var panel1:QuickSettings;


	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// <link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700" rel="stylesheet">
		FontUtil.embedGoogleFont('Oswald:200,300,400,500,600,700', onEmbedHandler);

		super(ctx);
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		drawShape();
	}

	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Quote generator")
			.setGlobalChangeHandler(untyped drawShape)
			.addHTML("Reason", "Sometimes I need a quick quote, to post on Instagram")

			.addTextArea('Quote', 'text', function (value) trace(value) )
			.addBoolean('All Caps', false, function (value) trace(value) )

			.saveInLocalStorage('store-data-${toString()}');
	}


	function createShape(i:Int, ?point:Point){
		var shape : Circle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
			radius:_radius,
		}
		onAnimateHandler(shape);
		return shape;
	}

	function onAnimateHandler(circle:Circle){
		// GoJs.to(circle, 5).x(w/2).y(h/2).ease(lets.easing.Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	}

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(WHITE);

		ctx.fillStyle = getColourObj(_color4);
		FontUtil.centerFillText(ctx, 'text', w/2, h/2, "'Oswald', sans-serif;", 160);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		for ( i in 0 ... shapeArray.length ) {
			var sh = shapeArray[i];
		}
		var rgb = randomColourObject();
		ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		ctx.xcross(w/2, h/2, 200);
	}


	override function setup(){
		trace('setup: ${toString()}');

		var colorArray = lib.util.ColorUtil.niceColor100SortedString[randomInt(lib.util.ColorUtil.niceColor100SortedString.length-1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);
		_color3 = hex2RGB(colorArray[3]);
		_color4 = hex2RGB(colorArray[4]);

		isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// grid.setNumbered(3,3);
		grid.setCellSize(_cellsize);
		grid.setIsCenterPoint(true);

		shapeArray = [];
		for (i in 0...grid.array.length) {
			shapeArray.push(createShape(i, grid.array[i]));
		}
	}

	override function draw(){
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}