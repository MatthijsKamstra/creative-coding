package art;

import js.html.svg.SVGElement;
import AST;

/**
 * short description what this does
 */
class CC052 extends CCBase implements ICCBase {
	var shapeArray:Array<InstaLikes> = [];
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
	var svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 81 71" width="81px" height="71px"><path d="M70.6.31H10.78C5.06.31.38 4.99.38 10.71v33.53c0 5.72 4.68 10.4 10.4 10.4H21.3c1.08 0 2.11.43 2.88 1.19l13.6 13.6a4.062 4.062 0 0 0 5.75 0l13.6-13.6a4.08 4.08 0 0 1 2.88-1.19H70.6c5.72 0 10.4-4.68 10.4-10.4V10.71C81 4.99 76.32.31 70.6.31z" fill="#f4555a"/><path d="M43.5 22.04c0-4.03-3.26-7.29-7.29-7.29-3.39 0-6.23 2.31-7.05 5.44a7.288 7.288 0 0 0-7.05-5.44c-4.03 0-7.29 3.26-7.29 7.29 0 1.98.79 3.77 2.07 5.09l.03.03.06.06 11.66 11.66 12.29-11.31a7.178 7.178 0 0 0 2.57-5.53z" fill="#fff"/></svg>';
	var svgImage:Image;
	// image for some reason looses its size
	var svgWidth = 81;
	var svgHeight = 71;
	var isSvgReady = false;
	var isFontReady = false; // doesn't work offline...
	var padding = 5;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// _cellsize = svgWidth;

		// <link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700" rel="stylesheet">
		// Text.embedGoogleFont('Roboto:300', onEmbedHandler);

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

		// var parser = new DOMParser();
		// var doc = parser.parseFromString(svg, IMAGE_SVG_XML);

		// console.log(doc);
		// document.body.appendChild(doc);
		// document.body.append(svg);

		document.body.appendChild(svgImage); // draw the image onto the canvas

		// ctx.drawImage(img, 10, 10);
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		isFontReady = true;
		drawShape();
	}

	function createLike(i:Int, ?point:Point) {
		var shape:InstaLikes = {
			_id: '$i',
			x: point.x,
			y: point.y,
			width: svgWidth,
			height: svgHeight,
			count: i,
			percentage: 0,
		}
		// onAnimateHandler(shape);
		return shape;
	}

	function drawShape() {
		if (!isSvgReady)
			return;
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		// isDebug = true;

		console.warn('☠️ Doesn\'t work in Firefox');
		// https://stackoverflow.com/questions/28690643/firefox-error-rendering-an-svg-image-to-html5-canvas-with-drawimage
		// viewBox="0 0 81 71" width="81px" height="71px">
		// add to the viewbox width and height

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			// trace(sh);
			ctx.drawImage(svgImage, sh.x - (sh.width / 2), sh.y - (sh.height / 2), sh.width, sh.height);
			ctx.fillColourRGB(WHITE);
			// ctx.fillColourRGB(GREEN);
			Text.create(ctx, Std.string(sh.count + 1))
				// .font('Miso')
				.centerAlign()
				.pos(sh.x + 20, sh.y)
				.size(20)
				.draw();
		}
		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w / 2, h / 2, 200);
		stop();
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
		grid.setCellSize(svgWidth + padding, svgHeight + padding);
		grid.setIsCenterPoint(true);

		shapeArray = [];
		for (i in 0...grid.array.length) {
			shapeArray.push(createLike(i, grid.array[i]));
		}
	}

	override function draw() {
		trace('draw: ${toString()}');
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
}
