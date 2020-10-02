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
	// var src = '/assets/img/spritesheet/web_heart_animation_edge.png';
	var src = 'assets/img/spritesheet/web_heart_animation_edge.png';
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
		createQuickSettings();
		Spritesheet.load(src, onSpritesheetComplete);
		Text.embedGoogleFont('Berkshire+Swash', onFontComplete);
	}

	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Zip exporter")
			.setGlobalChangeHandler(untyped drawShape)
			.addRange('delay', 0.0, 5.0, 2.0, 0.5, function(e) setDelay(e))
			.addRange('record', 0.0, 30.0, 2.0, 0.5, function(e) setRecord(e))

			.addButton('init recording', function(e) onClickHandler(e))
			.addButton('start recording', function(e) onClickHandler(e))
			.addButton('stop recording', function(e) onClickHandler(e))

			.saveInLocalStorage('store-data-${toString()}');
	}

	function setDelay(e) {
		trace(e);
	}

	function setRecord(e) {
		trace(e);
	}

	function onClickHandler(e:js.html.MouseEvent) {
		var input:js.html.InputElement = cast(e);

		switch (input.value) {
			case 'init recording':
				trace('init recording');
			case 'start recording':
				trace('start recording');
			case 'stop recording':
				trace('stop recording');
			default:
				trace("case '" + input.value + "': trace ('" + input.value + "');");
		}
	}

	function onSpritesheetComplete(img:Image) {
		this._img = img;
		isImageLoaded = true;
		drawShape();

		haxe.Timer.delay(function() {
			delayCallHandler();
		}, 2000);
	}

	function delayCallHandler() {
		for (i in 0...10) {
			Spritesheet.create(ctx, _img)
				.cell(100, 100)
				.pos(i * 110, 0)
				.animate()
				.delay(60 * i)
				.draw();
		}

		var _scale = 4;
		Spritesheet.create(ctx, _img)
			.debug(isDebug)
			.fps(5)
			.cell(100, 100)
			.scale(_scale)
			.pos(w - (100 * _scale), 0)
			.animate()
			.draw();

		Spritesheet.create(ctx, _img)
			.debug(isDebug)
			.fps(15)
			.cell(100, 100)
			.scale(_scale)
			.pos(0, h - (100 * _scale))
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

	function onFontComplete(e) {
		trace('onFontComplete: "${e}"');
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
