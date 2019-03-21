package art;

import cc.draw.Spritesheet;

/**
 * short description what this does
 */
class CC055 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	// sizes
	var _cellsize = 100;
	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;
	var panel1:QuickSettings;
	var isFontLoaded:Bool = false;
	var isImageLoaded:Bool = false;
	var spritesheet:Spritesheet; // hmm doesn't work like expected
	var src = '/assets/img/spritesheet/web_heart_animation_edge.png';
	var _img:Image;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// setup Sketch
		var option = new Sketch.SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		init();

		super(ctx);
	}

	/**
	 *
	 * like image from twitter
	 * https://abs.twimg.com/a/1552443372/img/animations/web_heart_animation_edge.png
	 *
	**/
	function init() {
		Spritesheet.load(src, onLoadedComplete);
		Text.embedGoogleFont('Berkshire+Swash', onEmbedHandler);
	}

	function onLoadedComplete(img:Image) {
		this._img = img;
		isImageLoaded = true;
		drawShape();

		var _scale = 4;

		// spritesheet = new Spritesheet(ctx, _img);

		// spritesheet.debug(isDebug)
		// 	.index(0)
		// 	.cell(100, 100)
		// 	.scale(_scale)
		// 	.center();

		// spritesheet
		// 	.fps(15)
		// 	.pos(w3 * 2, h3 * 2)
		// 	.animate()
		// 	.draw();

		// spritesheet
		// 	.pos(w3, h3)
		// 	.index(10) // .animate()
		// 	.draw();

		haxe.Timer.delay(function() {
			delayCallHandler();
		}, 2000);
	}

	function delayCallHandler() {
		var _scale = 4;
		Spritesheet.create(ctx, _img)
			.debug(isDebug)
			.fps(15)
			.cell(100, 100)
			.scale(_scale)
			.pos(w - (100 * _scale), 0)
			.animate()
			.draw();

		Spritesheet.create(ctx, _img)
			.debug(isDebug)
			.fps(30)
			.cell(100, 100)
			.scale(_scale)
			.center()
			.pos(w3, h3)
			.animate()
			.draw();

		Spritesheet.create(ctx, _img)
			.debug(isDebug)
			.fps(60)
			.cell(100, 100)
			.scale(_scale)
			.center()
			.pos(w3 * 2, h3 * 2)
			.animate()
			.draw();

		ctx.strokeWeight(2);
		ctx.strokeColourRGB(_color2);
		ctx.centreStrokeRect(w3 * 2, h3 * 2, 100 * _scale, 100 * _scale);
		ctx.strokeColourRGB(_color3);
		ctx.centreStrokeRect(w3, h3, 100 * _scale, 100 * _scale);
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		isFontLoaded = true;
		drawShape();
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(_color0);

		// if (isDebug) {
		// 	ShapeUtil.gridField(ctx, grid);
		// }

		// if (isEmbedded) {
		// 	var size = 100;
		// 	Text.create(ctx, "Like me or not,")
		// 		.color(_color4)
		// 		.font('Berkshire+Swash')
		// 		.centerAlign()
		// 		.size(size)
		// 		.pos(w2, h2)
		// 		.draw();
		// 	Text.create(ctx, "that is the question!")
		// 		.color(_color4)
		// 		.font('Berkshire+Swash')
		// 		.centerAlign()
		// 		.size(size)
		// 		.pos(w2, h2 + size)
		// 		.draw();
		// }
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

		// shapeArray = [];
		// for (i in 0...grid.array.length) {
		// 	shapeArray.push(createShape(i, grid.array[i]));
		// }
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
