package art;

import js.JSZip;
import cc.tool.export.Zip;

using StringTools;

/**
 * short description what this does
 */
class CC056 extends CCBase implements ICCBase {
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
	var isZipLoaded:Bool = false;
	var isFileLoaded:Bool = false;
	var isExportActive:Bool = false;
	//
	var _delayCounter:Int = 0;
	var _recordCounter:Int = 0;
	var _delay:Int = 120; // (60*3) 60fps * 3sec
	var _record:Int = 600; // (60*10) 60fpx * 5sec
	// timer
	var startT:Float;
	var endT:Float;
	// var imageArray:Array<js.html.ImageData> = [];
	var imageStringArray:Array<String> = [];

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Zip test';
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

	function init() {
		// <link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700" rel="stylesheet">
		Text.embedGoogleFont('Oswald:200,300,400,500,600,700', onEmbedHandler);
		var zip = new Zip(ctx);
		zip.embedScripts(onZipHandler);
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		isFontLoaded = true;
		drawShape();
	}

	function onZipHandler(?value:String) {
		trace(value);
		// switch (str) {
		// 	case 'jsfilesaver':
		// 		trace('jsfilesaver');
		// 		isFileLoaded = true;
		// 	case 'jszip':
		// 		trace('jszip');
		// 		isZipLoaded = true;
		// 	default:
		// 		trace("case '" + str + "': trace ('" + str + "');");
		// }
		// if (isFileLoaded && isZipLoaded) {
		// 	// startExport();
		// 	// haxe.Timer.delay(function() {
		// 	// 	var img = ctx.canvas.toDataURL('image/png').replace('data:image/png;base64,', '');
		// 	// 	var img2 = ctx.canvas.toDataURL();

		// 	// 	var zip = new JSZip();
		// 	// 	zip.file('_${toString()}/sequence/_readme.md', '# Hello world');
		// 	// 	zip.file('_${toString()}/base64.txt', img);
		// 	// 	zip.file('_${toString()}/sequence/image_00000.png', img, {base64: true});
		// 	// 	zip.generateAsync({type: "blob"}).then(function(blob) { // 1) generate the zip file
		// 	// 		console.log('save zip');
		// 	// 		untyped saveAs(blob, '_${toString()}.zip'); // 2) trigger the download
		// 	// 	}, function(err) {
		// 	// 		console.log(err);
		// 	// 	});
		// 	// }, 1000);
		// 	// haxe.Timer.delay(function() {
		// 	// 	startExport();
		// 	// }, 2000);
		// 	// haxe.Timer.delay(function() {
		// 	// 	stopExport();
		// 	// }, 5000);
		// 	// var zip = new JSZip();
		// 	// zip.file("/hello/Hello.txt", "Hello World\n");
		// 	// zip.generateAsync({type: "blob"})
		// 	// 	.then(function(content) {
		// 	// 		// see FileSaver.js
		// 	// 		untyped saveAs(content, "example.zip");
		// 	// 	});
		// 	/*
		// 		ctx.canvas.toBlob(function(bl:Blob) {
		// 			var zip = untyped __js__('new JSZip()');
		// 			untyped __js__('zip.file(\'sequence/_readme.md\', \'# Hello world\');');
		// 			untyped __js__('zip.file(\'sequence/image_0000.png\', bl);');
		// 			zip.generateAsync({type: "blob"}).then(function(blob) { // 1) generate the zip file
		// 				untyped saveAs(blob, ' ${toString()}.zip'); // 2) trigger the download
		// 			}, function(err) {
		// 				console.log(err);
		// 			});
		// 		});
		// 	 */
		// }
	}

	function startExport() {
		startT = Date.now().getTime();
		isExportActive = true;
		imageStringArray = [];
		// imageArray.push(ctx.getImageData(0, 0, w, h));
		trace(toString() + ' - start export - 0ms');
		// trace(imageArray.length);
	}

	function stopExport() {
		endT = Date.now().getTime();
		isExportActive = false;
		trace(toString() + ' - stop export - ${(endT - startT) / 1000}sec');

		var timeStamp = endT;

		var md = '# ${toString()}

- Generated on: ${Date.now()}
- total images: ${imageStringArray.length}
- file name: + _${toString()}_${timeStamp}.zip
- delay: ${_delay} frames (${_delay / 60} sec)
- record: ${_record} frames (${_record / 60} sec)



## Instagram

```
sketch.${toString()} :: ${description}


#codeart #coding #creativecode #generative #generativeArt
#minimalism #minimalist #minimal
#haxe #javascript #js #nodejs
```

## convert

open terminal

```
sh convert.sh
```

## Folder structure

```
+ _${toString()}_${timeStamp}.zip
	+ _${toString()}
		- convert.sh
		- README.MD
		+ sequence
			- image_${Std.string(0).lpad('0', 4)}.png
			- image_${Std.string(1).lpad('0', 4)}.png
			- ...
```
';

		var bash = '#!/bin/bash

echo \'Start convertions png sequens to mp4\'

ffmpeg -y -r 30 -i sequence/image_%04d.png -c:v libx264 -strict -2 -pix_fmt yuv420p -shortest -filter:v "setpts=0.5*PTS"  ${toString()}_output_30fps.mp4
# ffmpeg -y -r 30 -i sequence/image_%04d.png -c:v libx264 -strict -2 -pix_fmt yuv420p -shortest -filter:v "setpts=0.5*PTS"  sequence/_output_30fps.mp4

echo \'End convertions png sequens to mp4\'

';

		trace('Start creation zip file - ${(Date.now().getTime() - startT) / 1000}sec');
		var zip = new JSZip();
		zip.file('_${toString()}/README.MD', md);
		zip.file('_${toString()}/convert.sh', bash);
		for (i in 0...imageStringArray.length) {
			trace('/${imageStringArray.length}. add image to file');
			var img = imageStringArray[i];
			zip.file('_${toString()}/sequence/image_${Std.string(i).lpad('0', 4)}.png', img, {base64: true});
		}
		trace('Generate zip file - ${(Date.now().getTime() - startT) / 1000}sec');
		zip.generateAsync({type: "blob"}).then(function(blob) { // 1) generate the zip file
			console.log('Save zip file complete - ${(Date.now().getTime() - startT) / 1000}sec');
			untyped saveAs(blob, '_${toString()}_${timeStamp}.zip'); // 2) trigger the download
		}, function(err) {
			console.log(err);
		});
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

		// Text.centerFillText(ctx, 'Zip export test', w / 2, h / 2, "'Oswald', sans-serif;", 160);

		if (isExportActive) {
			if (_delayCounter < _delay) {
				// trace('>= ${_delay} (delay)');
				trace('delay: ${_delayCounter} >= ${_delay}');
			}

			if (_delayCounter >= _delay) {
				if (_recordCounter < _record) {
					// trace('< ${_record} (recording)');
					trace('recording: ${_recordCounter} <  ${_record}');
					imageStringArray.push(ctx.canvas.toDataURL('image/png').split('base64,')[1]);
					_recordCounter++;
				} else {
					stopExport();
				}
			}
		}

		_delayCounter++;
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
		return 'cc056';
	}
}
