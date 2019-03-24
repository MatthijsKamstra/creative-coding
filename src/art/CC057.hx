package art;

using StringTools;

import cc.tool.export.Zip;

/**
 * short description what this does
 */
class CC057 extends CCBase implements ICCBase {
	var shapeArray:Array<InstaFollower> = [];
	// colors
	var _color0:RGB = hex2RGB('#FF9000');
	var _color1:RGB = hex2RGB("#F0F0DF");
	var _color2:RGB = hex2RGB('#BDD3DE');
	var _color3:RGB = hex2RGB('#3F5866');
	var _color4:RGB = hex2RGB('#2B3A42');
	//
	var isFontLoaded:Bool = false;
	var isJsonLoaded:Bool = false;
	var isDefaultLoaded:Bool = false;
	var isCounterVisible:Bool = false;
	var isPayoffVisible:Bool = false;
	//
	var imageW = 100;
	var imageH = 100;
	var json:Array<Dynamic>;
	var yoffset = 200; //
	var defaultImage:Image;
	var timeDelay = 3;
	var timeDelayOffset = 0.15;
	var _followerCount = -1;
	var zip:Zip;
	var goalCount = 250;

	public function new(ctx:CanvasRenderingContext2D) {
		// setup Sketch
		var option = new Sketch.SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		Text.embedGoogleFont('Abel', onFontHandler);
		onJsonHandler();

		zip = new Zip(ctx, '${toString()}');
		zip.delayInSeconds(0);
		zip.recordInSeconds(37);
		zip.menu(false);
		zip.embedScripts(onZipHandler);
		zip.onComplete(onZipCompleteHandler);

		super(ctx);
	}

	function createFollowerList() {
		shapeArray = [];
		for (i in 0...json.length) {
			var instaObj = json[i];
			shapeArray.push(createFollower(i, instaObj));
			loadImage(i, instaObj);
			// if (i >= 2)
			// 	return;
		}
	}

	function onZipHandler(?value:String) {
		trace(value);
		// zip.start();
	}

	function onZipCompleteHandler(?value:Dynamic) {
		trace('onZipCompleteHandler : $value');
		stop();
	}

	function createFollower(i:Int, insta:InstaObj) {
		var sh:InstaFollower = {
			i: i,
			_id: '$i',
			x: w / 2,
			y: h / 2,
			width: imageH,
			height: imageH,
			count: i,
			percentage: 0,
			radius: random(30, 100),
			speed: random(-3, 3),
			angle: random(360),
			name: insta.name,
			src: insta.src,
			img: null
		}
		onAnimateHandler(sh);
		return sh;
	}

	function resetInstaLike(sh:InstaFollower) {
		sh.x = random((1 * imageW), w - (1 * imageW));
		sh.y = h + yoffset;
	}

	function onAnimateHandler(sh:InstaFollower) {
		resetInstaLike(sh);
		Go.to(sh, random(7, 8))
			.delay((sh.i * timeDelayOffset) + timeDelay)
			.x(sh.x)
			.y(-yoffset * 2)
			.onAnimationStart(onAnimationStart, [sh.i])
			.ease(Sine.easeOut);

		// .onComplete(onAnimateHandler, [sh]);
	}

	function onAnimationStart(i:Int) {
		// trace('start animation : ' + i);
		isCounterVisible = true;
		_followerCount++;
		// trace(_followerCount, shapeArray.length - 1);
		if (_followerCount == shapeArray.length - 1) {
			haxe.Timer.delay(function() {
				this.isPayoffVisible = true;
				this.isCounterVisible = false;
			}, 3000);
		}
	}

	function drawShape() {
		if (json == null)
			return;

		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(_color1);

		ctx.fillColourRGB(BLACK);
		Text.create(ctx, 'Current obsession is\nto have ${goalCount} followers')
			.font("Abel")
			.centerAlign()
			.topBaseline()
			.pos(w / 2, 100)
			.size(100)
			.draw();

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.save();

			sh.angle += sh.speed;
			// plot the balls x to cos and y to sin
			var xpos = sh.x + Math.cos(radians(sh.angle)) * sh.radius;
			var ypos = sh.y + Math.sin(radians(sh.angle)) * sh.radius;
			var r = imageW / 2;

			ctx.fillColourRGB(_color4);

			Text.create(ctx, sh.name.replace('&amp;', '&'))
				.font("Abel")
				.centerAlign()
				.topBaseline()
				.pos(xpos + r, ypos + imageH + 10)
				.size(20)
				.draw();

			ctx.fillColourRGB(WHITE);
			ctx.strokeColourRGB(_color4);

			ctx.circleFillStroke(xpos + r, ypos + r, r + 7);
			ctx.circleStroke(xpos + r, ypos + r, r);
			ctx.circle(xpos + r, ypos + r, r);

			ctx.clip();
			if (sh.img != null) {
				ctx.drawImage(sh.img, xpos, ypos, imageW, imageH);
			} else {
				if (isDefaultLoaded)
					ctx.drawImage(defaultImage, xpos, ypos, imageW, imageH);
			}

			ctx.restore();
		}

		if (_followerCount <= -1)
			return;
		Text.create(ctx, 'Meet my followers:\n${shapeArray[_followerCount].name}\n${_followerCount + 1}/${shapeArray.length}')
			.font("Abel")
			.color(_color3)
			.centerAlign()
			.topBaseline()
			.pos(w2, 400)
			.visible(isCounterVisible)
			.size(60)
			.draw();

		Text.create(ctx, 'Follow me and be in\nthe next animation!\nI only need ${goalCount - shapeArray.length} more.')
			.font("Abel")
			.color(_color3)
			.centerAlign()
			.topBaseline()
			.pos(w2, 400)
			.visible(isPayoffVisible)
			.size(80)
			.draw();
	}

	override function setup() {
		trace('setup: ${toString()}');

		// var colorArray = ColorUtil.niceColor100SortedString[randomInt(ColorUtil.niceColor100SortedString.length - 1)];
		// _color0 = hex2RGB(colorArray[0]);
		// _color1 = hex2RGB(colorArray[1]);
		// _color2 = hex2RGB(colorArray[2]);
		// _color3 = hex2RGB(colorArray[3]);
		// _color4 = hex2RGB(colorArray[4]);

		// isDebug = true;

		// // grid.setDimension(w*2.1, h*2.1);
		// // grid.setNumbered(3,3);
		// grid.setCellSize(_cellsize);
		// grid.setIsCenterPoint(true);

		// shapeArray = [];
		// for (i in 0...grid.array.length) {
		// 	shapeArray.push(createShape(i, grid.array[i]));
		// }
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		zip.pulse();
		// stop();
	} // ____________________________________ handler ____________________________________

	function onJsonHandler() {
		var url = 'assets/insta.json';
		var req = new haxe.Http(url);
		// req.setHeader('Content-Type', 'application/json');
		// req.setHeader('auth', '${App.TOKEN}');
		req.onData = function(data:String) {
			try {
				json = haxe.Json.parse(data);
				json.reverse();
				// trace(json);
				// trace(json[0].name);
				isJsonLoaded = true;
				// trace(json.length);
				createFollowerList();
			} catch (e:Dynamic) {
				trace(e);
			}
		}
		req.onError = function(error:String) {
			trace('error: $error');
		}
		req.onStatus = function(status:Int) {
			trace('status: $status');
		}
		req.request(true); // false=GET, true=POST
	}

	function onFontHandler(e) {
		trace('onFontHandler: "${e}"');
		isFontLoaded = true;
		drawShape();
	}

	function loadImage(i:Int, obj:InstaObj) {
		var img = new Image();
		img.crossOrigin = "anonymous";
		img.onload = function() {
			shapeArray[i].img = img;
		}
		img.src = obj.src;
	}

	function loadDefaultImage() {
		var img = new Image();
		img.crossOrigin = "anonymous";
		img.onload = function() {
			defaultImage = img;
			isDefaultLoaded = true;
		}
		img.src = 'assets/img/profile/noprofile_instagram.jpg';
	}
}
