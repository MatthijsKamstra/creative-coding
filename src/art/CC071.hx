package art;

/**
 * short description what this does
 */
class CC071 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
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
	var isFontLoaded:Bool = false;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// // setup Sketch
		// var option = new Sketch.SketchOption();
		// option.width = 1080; // 1080
		// // option.height = 1000;
		// option.autostart = true;
		// option.padding = 10;
		// option.scale = true;
		// ctx = Sketch.create("creative_code_mck", option);

		super(ctx);
	}

	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Quote generator")
			.setGlobalChangeHandler(untyped drawShape)
			.addHTML("Reason", "Sometimes I need a quick quote, to post on Instagram")
			.addTextArea('Quote', 'text', function(value) trace(value))
			.addBoolean('All Caps', false, function(value) trace(value))
			.saveInLocalStorage('store-data-${toString()}');
	}

	function createShape(i:Int, ?point:Point) {
		var shape:Circle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
			radius: _radius,
		}
		onAnimateHandler(shape);
		return shape;
	}

	function onAnimateHandler(circle:Circle) {
		// Go.to(circle, 5).x(w/2).y(h/2).ease(Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		ctx.fillStyle = getColourObj(_color4);
		Text.centerFillText(ctx, 'text', w / 2, h / 2, "'Oswald', sans-serif;", 160);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
		}
		var rgb = randomColourObject();
		ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		ctx.xcross(w / 2, h / 2, 200);
	}

	override function setup() {
		trace('setup: ${toString()}');

		var colorArray = ColorUtil.niceColor100SortedString[randomInt(ColorUtil.niceColor100SortedString.length - 1)];
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

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
