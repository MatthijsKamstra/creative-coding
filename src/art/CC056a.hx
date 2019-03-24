package art;

import cc.tool.export.Zip;

/**
 * short description what this does
 */
class CC056a extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	// sizes
	var _radius = 20;
	var _cellsize = 150;
	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;
	var panel1:QuickSettings;
	//
	var isFontLoaded:Bool = false;
	var zip:Zip;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Export Zip test, test features';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// setup Sketch
		var option = new Sketch.SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		zip = new Zip(ctx, '${toString()}');
		zip.delay(60 * 3);
		zip.record(60 * 3);
		zip.embedScripts(onZipHandler);

		Text.embedGoogleFont('Oswald:200,300,400,500,600,700', onEmbedHandler);

		super(ctx);
	}

	function onZipHandler(?value:String) {
		trace(value);
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		isFontLoaded = true;
		drawShape();
	}

	function createShape(i:Int, ?point:Point) {
		var shape:Circle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
			radius: _radius,
			rgb: randomColourObject()
		}
		onAnimateHandler(shape);
		return shape;
	}

	function onAnimateHandler(circle:Circle) {
		Go.to(circle, random(3, 5))
			.x(random(0, w))
			.y(random(0, h))
			.ease(Sine.easeInOut)
			.onComplete(onAnimateHandler, [circle]);
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.fillColourRGB(sh.rgb);
			ctx.circleFill(sh.x, sh.y, sh.radius);
		}
		var rgb = randomColourObject();
		ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		ctx.xcross(w / 2, h / 2, 200);

		ctx.fillStyle = getColourObj(_color4);
		Text.create(ctx, 'Zip export test')
			.centerAlign()
			.middleBaseline()
			.font('Oswald')
			.size(160)
			.pos(w2, h2)
			.draw();

		zip.pulse();
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
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}

	override function toString():String {
		return 'cc056a';
	}
}
