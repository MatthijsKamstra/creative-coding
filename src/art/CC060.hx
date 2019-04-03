package art;

import cc.tool.Loader;

using StringTools;

/**
 * short description what this does
 */
class CC060 extends CCBase implements ICCBase {
	// colors
	var _color0:RGB = hex2RGB('#000000'); // black
	var _color1:RGB = hex2RGB('#FEF006'); // yellow
	var _color2:RGB = hex2RGB('#C52C03'); // red
	var _color3:RGB = hex2RGB('#FF8E5B'); // oragne
	var _color4:RGB = hex2RGB('#FFC506'); // yellow
	var _color5:RGB = hex2RGB('#8EC52D'); // green
	var _color6:RGB = hex2RGB('#2D8E03'); // dark green
	var panel1:QuickSettings;
	// svg
	var svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50"><path fill="red" stroke="black" stroke-width="2" d="M25 39.7l-.6-.5C11.5 28.7 8 25 8 19c0-5 4-9 9-9 4.1 0 6.4 2.3 8 4.1 1.6-1.8 3.9-4.1 8-4.1 5 0 9 4 9 9 0 6-3.5 9.7-16.4 20.2l-.6.5z"/></svg>';
	var svgImage:Image;
	// image for some reason looses its size
	var svgSize = 600;
	// var svgWidth = 200;
	// var svgHeight = 71;
	var isSvgLoaded:Bool = false;
	var isFontLoaded:Bool = false;
	var isImageLoaded:Bool = false;
	var patternCounter = 0;
	// heart
	var heartObj:Dynamic;
	var cursorObj:Dynamic;
	var animationInSeconds = 1.5;
	var src = 'assets/img/cursor/hand_fill.png';
	var _img:Image;
	var imgSize = 100;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Warning: like this post and you will be featured in the next animation!';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// setup Sketch
		var option = new Sketch.SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		super(ctx);
	}

	function onSvgHandler(image:Image) {
		svgImage = image;
		isSvgLoaded = true;
		drawShape();
	}

	function onImageHandler(arr:Array<cc.tool.LoaderObj>) {
		trace('total images: ' + arr.length);
		// trace('first image width: ' + arr[0].width);
		this._img = arr[0].image;
		isImageLoaded = true;
		drawShape();
	}

	function onHeartYoyoHandler(sh:Dynamic) {
		Go.to(sh, animationInSeconds)
			.prop('size', (svgSize * .7))
			.yoyo()
			.ease(Quart.easeInOut)
			.onComplete(onHeartYoyoHandler, [sh]);
	}

	function onShowCursorHandler(sh:Dynamic) {
		Go.to(sh, animationInSeconds)
			.delay(animationInSeconds * 3)
			.x(w2)
			.y(h2)
			.ease(Quart.easeInOut)
			.onComplete(onHideCursorHandler, [cursorObj]);
	}

	function onHideCursorHandler(sh:Dynamic) {
		Go.to(sh, animationInSeconds)
			.delay(.5)
			.x(w + (imgSize))
			.y(h + (imgSize))
			.ease(Quart.easeInOut) // .onComplete(onHideCursorHandler, [cursorObj])
		;
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(BLACK);

		if (!isFontLoaded && !isSvgLoaded)
			return;

		var size = 1080;
		var strokeW = 50;
		// background pattern black and yellow
		for (i in 0...size) {
			ctx.save();
			ctx.translate((strokeW * i) - size + patternCounter, 0);
			ctx.strokeWeight(strokeW);
			if (i % 2 == 0) {
				ctx.lineColourRGB(_color1);
			} else {
				ctx.lineColourRGB(_color0);
			}
			ctx.lineCap = ('square');
			ctx.line(size, size, 0, 0);
			ctx.restore();
		}
		var xpos = w2;
		var ypos = h4 - 70;
		var padding = 50;

		// warning block at the top

		ctx.fillColourRGB(_color0);
		ctx.fillRect(padding, padding, w - (2 * padding), 250);
		var text = Text.create(ctx, 'warning'.toUpperCase())
			.pos(xpos, ypos)
			.color(_color1)
			.centerAlign()
			.middleBaseline()
			.font('Gunplay')
			.size(200)
			.draw();

		var xpos = w2;
		var ypos = (h4 * 3) - 10;
		var bHeight = 300;
		ctx.fillColourRGB(_color0);
		ctx.fillRect(padding, h - padding - bHeight, w - (2 * padding), bHeight);
		var text = Text.create(ctx, 'this post and you\nwill be featured in\nthe next animation!'.toUpperCase())
			.pos(xpos, ypos)
			.color(_color1)
			.centerAlign()
			.middleBaseline()
			.font('Gunplay')
			.size(90)
			.draw();

		ctx.drawImage(svgImage, heartObj.x + ((svgSize - heartObj.size) / 2), heartObj.y + ((svgSize - heartObj.size) / 2), heartObj.size, heartObj.size);

		if (isImageLoaded) {
			ctx.drawImage(_img, cursorObj.x, cursorObj.y, imgSize, imgSize);
		}

		patternCounter++;
		if (patternCounter >= strokeW * 2)
			patternCounter = 0;
	}

	override function setup() {
		trace('setup: ${toString()}');
		var font = new FontFace('Gunplay', 'url(assets/font/gunplay/Gunplay-Regular.woff2)', {
			style: 'normal',
			weight: '400',
		});
		document.fonts.add(font);
		font.load();
		font.loaded.then(function(fontface) {
			trace(fontface.family);
			isFontLoaded = true;
			drawShape();
		});

		// isDebug = true;

		heartObj = {
			x: w2 - svgSize / 2,
			y: h2 - svgSize / 2,
			size: svgSize,
		}
		var _svg = svg.replace('fill="red"', 'fill="${getColourObj(_color2)}"');
		cc.tool.convert.SvgToImage.convert(_svg, onSvgHandler);
		onHeartYoyoHandler(heartObj);

		cursorObj = {
			x: w + (imgSize),
			y: h + (imgSize),
			size: imgSize,
		}
		var load = Loader.create()
			.isDebug(isDebug)
			.add(src)
			.onComplete(onImageHandler)
			.isDebug(isDebug)
			.load();
		onShowCursorHandler(cursorObj);

		// zip.recordInSeconds(animationInSeconds * 6);
		// zip.record(600);
	}

	override function draw() {
		// trace('draw: ${toString()}');
		// super.draw(); // don't forget to add
		drawShape();
		// stop();
	}
}
