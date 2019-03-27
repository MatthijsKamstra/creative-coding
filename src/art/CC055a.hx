package art;

import cc.draw.Spritesheet;
import cc.tool.export.Zip;

/**
 * short description what this does
 */
class CC055a extends CCBase implements ICCBase {
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
	var isFont:Bool = false;
	var isZip:Bool = false;
	var isSpritesheet:Bool = false;
	var isFirstRun:Bool = false;
	var spritesheet:Spritesheet; // hmm doesn't work like expected
	var src = 'assets/img/spritesheet/web_heart_animation_edge.png';
	var zip:Zip;
	var _img:Image;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Loading spritesheet, animation spritesheet';
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
		zip.menu(false);
		zip.delay(0);
		zip.recordInSeconds(11);
		zip.embedScripts(onZipHandler);

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
		Spritesheet.load(src, onSpritesheetHandler);
		Text.embedGoogleFont('Berkshire+Swash', onFontHandler);
	}

	function onZipHandler(?value:String) {
		trace(value);
		isZip = true;
		drawShape();
	}

	function onSpritesheetHandler(img:Image) {
		this._img = img;
		isSpritesheet = true;
		drawShape();
	}

	function onFontHandler(e) {
		trace('onFontHandler: "${e}"');
		isFont = true;
		drawShape();
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		if (isSpritesheet) {
			for (i in 0...grid.array.length) {
				var point = grid.array[i];

				Spritesheet.create(ctx, _img)
					.fps(30)
					.debug(false)
					.cell(100, 100)
					.pos(point.x, point.y)
					.animate()
					.delay(5 * i)
					.center()
					.draw();
			}
		}
		if (isSpritesheet && isFont && isZip && !isFirstRun) {
			// zip.start();
			isFirstRun = true;
		}

		// if (isFont) {
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

		// for (i in 0...shapeArray.length) {
		// 	var sh = shapeArray[i];
		// }
		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w / 2, h / 2, 200);
	}

	override function setup() {
		trace('setup: ${toString()}');

		var colorArray = ColorUtil.niceColor100SortedString[randomInt(ColorUtil.niceColor100SortedString.length - 1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);
		_color3 = hex2RGB(colorArray[3]);
		_color4 = hex2RGB(colorArray[4]);

		// isDebug = true;

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
		// trace('draw: ${toString()}');
		zip.pulse();
		// drawShape();
		// stop();
	}
}
