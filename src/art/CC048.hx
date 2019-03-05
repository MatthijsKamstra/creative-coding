package art;

/**
 * https://unsplash.com/search/photos/fruit
 */
class CC048 extends CCBase implements ICCBase {
	var ctxHidden:CanvasRenderingContext2D;
	var shapeArray:Array<Pixel> = [];
	var grid:GridUtil = new GridUtil();
	// sizes
	// var _radius = 150;
	// var _cellsize = 150;
	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;
	// var panel1:QuickSettings;
	var _sizeX = 0;
	var _sizeY = 0;
	var _total = 0;
	var _padding = 0;
	var _scale = 0.2;
	var pixelCounter = 0;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);
	}

	function startCanvasImage(){
		trace('startCanvasImage :: start');
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		if (shapeArray.length <= 0)	return;
		_padding = Math.round((w - ctxHidden.canvas.width) / 2);

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			var xpos = _padding + sh.x;
			var ypos = _padding + sh.y;
			ctx.fillColour(sh.rgba.r, sh.rgba.g, sh.rgba.b, sh.rgba.a);
			ctx.fillRect(xpos, ypos, 1, 1);
		}
		trace('startCanvasImage :: done');
	}

	function drawShape() {

		if (shapeArray.length <= 0) return;


		for (i in 0..._sizeX){
			var sh = shapeArray[pixelCounter];


			// trace(sh.x, sh.y);

			sh.x = sh.x + randomInt(-1,1);
			sh.y = sh.y - 1;

			// trace(sh.x, sh.y);
			var __size = 5;

			var xpos = _padding + sh.x;
			var ypos = _padding + sh.y;
			ctx.fillColour(sh.rgba.r, sh.rgba.g, sh.rgba.b, sh.rgba.a);
			// ctx.fillColourRGB(randomColourObject());
			ctx.fillRect(xpos, ypos, 1, 1);


			pixelCounter++;
			if (pixelCounter >= _total) pixelCounter = 0;

			// trace(pixelCounter);
				//your code
		}
	}

	override function setup() {
		trace('setup: ${toString()}');

		// isDebug = true;

		trace('setup: start loading image');

		// start loading image
		var img = new Image();
		img.src = 'assets/img/fresh/xiaolong-wong-1297576-unsplash_square500x500.jpg';
		img.onload = function() {
			trace('setup: image loaded');
			var option = new Sketch.SketchOption();
			option.width = Math.round(img.width*_scale);
			option.height = Math.round(img.height*_scale);

			_sizeX = option.width;
			_sizeY = option.height;
			_total = _sizeX * _sizeY;

			trace('setup -> _sizeX: ${_sizeX}, _sizeY: ${_sizeY}, total pixels: ${_total}');

			ctxHidden = Sketch.createHiddenCanvas('imageholder', option, isDebug);
			ctxHidden.drawImage(img, 0, 0, option.width, option.height);
			img.style.display = 'none';
			setupDataArray(option.width, option.height);
		};
	}

	function setupDataArray(xdir, ydir) {
		trace('convert image: Start converting pixels to data');
		for (y in 0...ydir) {
			for (x in 0...xdir) {
				var pixel:Pixel = {
					x: x,
					y: y,
					colour: getPixel(x, y),
					rgb: getPixelRGB(x, y),
					rgba: getPixelRGBA(x, y),
				}
				shapeArray.push(pixel);
			}
		}
		trace('convert image: DONE');
		pixelCounter = 0;
		startCanvasImage();
	}

	function getPixel(x, y):String {
		var xpos = x;
		var ypos = y;
		var pixel = ctxHidden.getImageData(xpos, ypos, 1, 1);
		var data = pixel.data;
		var rgba = 'rgba(' + data[0] + ', ' + data[1] + ', ' + data[2] + ', ' + (data[3] / 255) + ')';
		return rgba;
	}

	function getPixelRGB(x, y):RGB {
		var xpos = x;
		var ypos = y;
		var pixel = ctxHidden.getImageData(xpos, ypos, 1, 1);
		var data = pixel.data;
		var RGBA:RGB = {
			r: data[0],
			g: data[1],
			b: data[2],
		}
		return RGBA;
	}

	function getPixelRGBA(x, y):RGBA {
		var xpos = x;
		var ypos = y;
		var pixel = ctxHidden.getImageData(xpos, ypos, 1, 1);
		var data = pixel.data;
		var RGBA:RGBA = {
			r: data[0],
			g: data[1],
			b: data[2],
			a: (data[3] / 255)
		}
		return RGBA;
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
