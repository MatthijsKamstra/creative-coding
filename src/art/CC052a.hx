package art;

import cc.*;
import cc.tool.Export;
import Sketch;

using StringTools;

/**
 * short description what this does
 */
class CC052a extends CCBase implements ICCBase {
	// store stuff here
	var shapeArray:Array<InstaLikes> = [];
	var grid:GridUtil = new GridUtil();
	var max = 100;
	// sizes
	var _radius = 150;
	var _cellsize = 150;
	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;
	// settings
	var panel1:QuickSettings;
	// svg
	var svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 81 71"><path d="M70.6.31H10.78C5.06.31.38 4.99.38 10.71v33.53c0 5.72 4.68 10.4 10.4 10.4H21.3c1.08 0 2.11.43 2.88 1.19l13.6 13.6a4.062 4.062 0 0 0 5.75 0l13.6-13.6a4.08 4.08 0 0 1 2.88-1.19H70.6c5.72 0 10.4-4.68 10.4-10.4V10.71C81 4.99 76.32.31 70.6.31z" fill="#f4555a"/><path d="M43.5 22.04c0-4.03-3.26-7.29-7.29-7.29-3.39 0-6.23 2.31-7.05 5.44a7.288 7.288 0 0 0-7.05-5.44c-4.03 0-7.29 3.26-7.29 7.29 0 1.98.79 3.77 2.07 5.09l.03.03.06.06 11.66 11.66 12.29-11.31a7.178 7.178 0 0 0 2.57-5.53z" fill="#fff"/></svg>';
	var svgImage:Image;
	// image for some reason looses its size
	var svgWidth = 81;
	var svgHeight = 71;
	var isSvgReady = false;
	// make sure font is loaded
	var isFontReady = false; // doesn't work offline...
	// pos
	var padding = 5;
	var yoffset = 50;
	// export video
	var export : Export;


	public function new(ctx:CanvasRenderingContext2D) {

		// setup Sketch
		var option = new SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		description = 'Get a lot of likes animation';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// <link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700" rel="stylesheet">
		// FontUtil.embedGoogleFont('Roboto:300', onEmbedHandler);

		super(ctx);

		initSVG();


	}

	function initSVG() {
		// create the image used
		svgImage = new Image();
		svgImage.onload = function() {
			trace('base64 square');
			trace('w: ' + svgImage.width);
			trace('h: ' + svgImage.height);

			isSvgReady = true;
			// svgImage.width = 81;
			// svgImage.height  = 71;
			// ctx.drawImage(img, w/2, h/2,81,71);
			drawShape();
		}

		// get svg data (from the dom)
		// var xml = new XMLSerializer().serializeToString(svg);

		// make it base64
		var svg64 = window.btoa(svg);
		var b64Start = 'data:image/svg+xml;base64,';

		// prepend a "header"
		var image64 = b64Start + svg64;

		// set it as the source of the img element
		svgImage.src = image64;

		// draw the image onto the canvas
		// ctx.drawImage(img, 10, 10);
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		isFontReady = true;
		drawShape();
	}

	function createLike(i:Int, ?point:Point):InstaLikes {

		var sh:InstaLikes = {
			_id: '$i',
			x: w/2,
			y: h /2,
			// x: random(w) - (svgWidth / 2),
			// y: h + yoffset - (svgHeight / 2),
			width: svgWidth,
			height: svgHeight,
			count: i,
			percentage: 0,
			radius : random(20,50),
			speed : random(-3,3),
			alpha: 2,
			angle: random(360),
		}
		onAnimateHandler(sh);
		return sh;
	}

	function resetInstaLike(sh:InstaLikes) {
		sh.x = random(w);
		sh.y = h + yoffset;
		sh.alpha = 2; // little hacky, because normally alpha is from 0 to 1
	}

	function onAnimateHandler(sh:InstaLikes) {
		resetInstaLike(sh);
		Go.to(sh, random(3,8))
			.delay(random(0.1, 7))
			.x(sh.x)
			.y(random(h/2, 0))
			.prop('alpha', 0)
			.ease(Sine.easeOut)
			.onComplete(onAnimateHandler, [sh]);
	}

	function drawShape() {
		if (!isSvgReady) return;

		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.save();
			ctx.globalAlpha = sh.alpha;

			sh.angle += sh.speed;
			// plot the balls x to cos and y to sin
			var xpos = sh.x + Math.cos(radians(sh.angle))*sh.radius;
			var ypos = sh.y + Math.sin(radians(sh.angle))*sh.radius;

			// trace('x: ${sh.x}, y: ${sh.y}, angle: ${sh.angle}, radius: ${sh.radius}' );
			ctx.drawImage(svgImage, xpos , ypos, sh.width, sh.height);
			// ctx.drawImage(svgImage, sh.x , sh.y, sh.width, sh.height);
			ctx.fillColourRGB(WHITE);
			FontUtil.create(ctx, Std.string(sh.count + 1))
				.centerAlign()
				.pos(xpos + (sh.width/2) + 20, ypos + (sh.height/2))
				.size(20)
				.draw();

			ctx.globalAlpha = 1;
			ctx.restore();
		}
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
		// grid.setCellSize(svgWidth+padding, svgHeight+padding);
		// grid.setIsCenterPoint(true);

		shapeArray = [];
		for (i in 0...max) {
			shapeArray.push(createLike(i, grid.array[i]));
		}

		// settings export
		export = new Export(ctx);
		export.time(30);
		export.name('${toString()}');
		export.folder('${toString()}');
		export.debug(isDebug);
		export.clear(true);
		export.start();

	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}

	/**
	 * just keep this here for reference
	 */
	function didnotwork() {
		var img = new Image();
		img.onload = function() {
			trace('green square');
			ctx.drawImage(img, w / 2, h / 2);
		}
		// img.src = "assets/img/likes/likes.svg";
		// img.src = "assets/img/mck.png";
		img.src = "http://upload.wikimedia.org/wikipedia/commons/d/d2/Svg_example_square.svg";
		trace(img.src);

		var img = new Image();
		img.onload = function() {
			trace('png');
			ctx.drawImage(img, w / 2, h / 2);
		}
		// img.src = "assets/img/likes/likes.svg";
		img.src = "assets/img/mck.png";
		// img.src = "http://upload.wikimedia.org/wikipedia/commons/d/d2/Svg_example_square.svg";
		trace(img.src);

		var img = new Image();
		img.onload = function() {
			trace('likes');
			ctx.drawImage(img, w / 2, h / 2);
		}
		img.src = "assets/img/likes/likes.svg";
		// img.src = "assets/img/mck.png";
		// img.src = "http://upload.wikimedia.org/wikipedia/commons/d/d2/Svg_example_square.svg";
		trace(img.src);

		var img = new Image();
		img.onload = function() {
			trace('likes.min');
			ctx.drawImage(img, w / 2, h / 2);
		}
		img.src = "assets/img/likes/likes.min.svg";
		// img.src = "assets/img/mck.png";
		// img.src = "http://upload.wikimedia.org/wikipedia/commons/d/d2/Svg_example_square.svg";
		trace(img.src);
	}

	override function toString():String {
		return 'cc052a';
	}

}
