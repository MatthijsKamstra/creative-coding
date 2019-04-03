package art;

using hxColorToolkit.ColorToolkit;
using StringTools;

// // import ColorUtil;
import mloader.Loader;
import mloader.JsonLoader;
import cc.tool.ExportFile;

/**
 * short description what this does
 */
class CC028 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var loader:JsonLoader<Dynamic>;
	var colorArr:Array<Array<String>> = [];
	var exportStringArray:Array<Array<String>> = [];
	var exportIntArray:Array<Array<Int>> = [];

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Convert 1000 colorcombos based on gray scale from light to dark';
		super(ctx);

		// loading gigantic 1000.json file with arrays
		loader = new JsonLoader<Dynamic>('assets/1000.json');
		loader.loaded.add(loaded);
		loader.load();
	}

	function loaded(event) {
		switch (event.type) {
			case Fail(error):
				trace(error);
			case Complete:
				// trace(event.target);
				// trace(event.target.content);
				// trace(event.target.content.length);
				colorArr = cast event.target.content;
				convertColors();
			default:
		}
	}

	function convertColors() {
		exportStringArray = [];
		exportIntArray = [];
		for (i in 0...colorArr.length) {
			var _colorArr = colorArr[i];
			// trace('$i , $_colorArr');
			var array:Array<{hex:Int, gray:Int}> = [
				{hex: convertToHex2(_colorArr[0]), gray: convertToHex2(_colorArr[0]).toGray().getColor()},
				{hex: convertToHex2(_colorArr[1]), gray: convertToHex2(_colorArr[1]).toGray().getColor()},
				{hex: convertToHex2(_colorArr[2]), gray: convertToHex2(_colorArr[2]).toGray().getColor()},
				{hex: convertToHex2(_colorArr[3]), gray: convertToHex2(_colorArr[3]).toGray().getColor()},
				{hex: convertToHex2(_colorArr[4]), gray: convertToHex2(_colorArr[4]).toGray().getColor()},
			];
			var copy = array.copy();
			haxe.ds.ArraySort.sort(copy, function(a, b) {
				if (a.gray < b.gray)
					return 1;
				else if (a.gray > b.gray)
					return -1;
				else
					return 0;
			});

			var storeStringArray:Array<String> = [];
			var storeIntArray:Array<Int> = [];
			for (j in 0...copy.length) {
				var __c = copy[j].hex;
				// trace(StringTools.hex(__c,6));
				// trace(__c);
				storeStringArray.push('#' + StringTools.hex(__c, 6));
				storeIntArray.push(__c);
				// ctx.fillColour(Math.round(__c.red), Math.round(__c.green), Math.round(__c.blue));
			}

			exportStringArray.push(storeStringArray);
			exportIntArray.push(storeIntArray);
		}
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		// if (isDebug) {
		// 	ShapeUtil.gridDots(ctx, grid);
		// }

		var colorArray = ColorUtil.niceColor100[10];
		var _color0 = hex2RGB(colorArray[0]);
		var _color1 = hex2RGB(colorArray[1]);
		var _color2 = hex2RGB(colorArray[2]);
		var _color3 = hex2RGB(colorArray[3]);
		var _color4 = hex2RGB(colorArray[4]);

		var _colorA = [_color0, _color1, _color2, _color3, _color4];
		var point:Point = grid.array[0];
		for (j in 0..._colorA.length) {
			var px = 10;
			var _w = Math.round((grid.cellWidth - px) / _colorA.length);
			var offsetX = j * _w;
			ctx.fillColourRGB(_colorA[j]);
			ctx.fillRect(offsetX + point.x, point.y, _w, grid.cellHeight - px);
		}

		var color = (Std.parseInt(colorArray[0].replace('#', '0x')));

		var _color0 = convertToHexToGray(colorArray[0]);
		var _color1 = convertToHexToGray(colorArray[1]);
		var _color2 = convertToHexToGray(colorArray[2]);
		var _color3 = convertToHexToGray(colorArray[3]);
		var _color4 = convertToHexToGray(colorArray[4]);

		var px = 10;
		var _w = Math.round((grid.cellWidth - px) / _colorA.length);

		var point:Point = grid.array[1];
		var _colorA = [_color0, _color1, _color2, _color3, _color4];
		for (j in 0..._colorA.length) {
			var offsetX = j * _w;
			ctx.fillColourRGB(_colorA[j]);
			ctx.fillRect(offsetX + point.x, point.y, _w, grid.cellHeight - px);
		}

		var array:Array<{hex:Int, gray:Int}> = [
			{hex: convertToHex2(colorArray[0]), gray: convertToHex2(colorArray[0]).toGray().getColor()},
			{hex: convertToHex2(colorArray[1]), gray: convertToHex2(colorArray[1]).toGray().getColor()},
			{hex: convertToHex2(colorArray[2]), gray: convertToHex2(colorArray[2]).toGray().getColor()},
			{hex: convertToHex2(colorArray[3]), gray: convertToHex2(colorArray[3]).toGray().getColor()},
			{hex: convertToHex2(colorArray[4]), gray: convertToHex2(colorArray[4]).toGray().getColor()},
		];
		console.log("An Array with objects", array);

		var copy = array.copy();
		haxe.ds.ArraySort.sort(copy, function(a, b) {
			if (a.gray < b.gray)
				return 1;
			else if (a.gray > b.gray)
				return -1;
			else
				return 0;
		});

		console.log("An Array with objects", copy);

		var point:Point = grid.array[2];
		for (j in 0...copy.length) {
			var offsetX = j * _w;
			var __c = copy[j].gray.toRGB();
			ctx.fillColour(Math.round(__c.red), Math.round(__c.green), Math.round(__c.blue));
			ctx.fillRect(offsetX + point.x, point.y, _w, grid.cellHeight - px);
		}

		var point:Point = grid.array[3];
		for (j in 0...copy.length) {
			var offsetX = j * _w;
			var __c = copy[j].hex.toRGB();
			ctx.fillColour(Math.round(__c.red), Math.round(__c.green), Math.round(__c.blue));
			ctx.fillRect(offsetX + point.x, point.y, _w, grid.cellHeight - px);
		}
	}

	// ____________________________________ override ____________________________________

	override function setup() {
		trace('setup: ${toString()}');
		grid.setNumbered(4, 1);

		window.addEventListener(KEY_DOWN, function(e:js.html.KeyboardEvent) {
			e.preventDefault();
			switch (e.key) {
				case 's':
					var arrayInt100 = [];
					var arrayString100 = [];
					var arrayInt500 = [];
					var arrayString500 = [];

					for (i in 0...exportIntArray.length) {
						var _exportIntArray = exportIntArray[i];
						var _exportStringArray = exportStringArray[i];

						if (i <= 100) {
							arrayInt100.push(_exportIntArray);
							arrayString100.push(_exportStringArray);
						}
						if (i <= 500) {
							arrayInt500.push(_exportIntArray);
							arrayString500.push(_exportStringArray);
						}
					}

					// ExportFile.downloadTextFile("This is the content of my file :)", "hello.json");
					ExportFile.downloadTextFile(haxe.Json.stringify(arrayInt100), "sorted_int_100.json");
					ExportFile.downloadTextFile(haxe.Json.stringify(arrayString100), "sorted_100.json");
					ExportFile.downloadTextFile(haxe.Json.stringify(arrayInt500), "sorted_int_500.json");
					ExportFile.downloadTextFile(haxe.Json.stringify(arrayString500), "sorted_500.json");
					ExportFile.downloadTextFile(haxe.Json.stringify(exportIntArray), "sorted_int_1000.json");
					ExportFile.downloadTextFile(haxe.Json.stringify(exportStringArray), "sorted_1000.json");
				default:
					trace("case '" + e.key + "': trace ('" + e.key + "');");
			}
		}, false);
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}

	// ____________________________________ misc ____________________________________

	function convertToHex(value:String):RGB {
		var _color = (Std.parseInt(value.replace('#', '0x')));
		var rgb:RGB = {
			r: Math.round(_color.toRGB().red),
			g: Math.round(_color.toRGB().green),
			b: Math.round(_color.toRGB().blue),
		}
		return rgb;
	}

	function convertToHexToGray(value:String):RGB {
		var _color = (Std.parseInt(value.replace('#', '0x')));
		var rgb:RGB = {
			r: Math.round(_color.toGray().toRGB().red),
			g: Math.round(_color.toGray().toRGB().green),
			b: Math.round(_color.toGray().toRGB().blue),
		}
		return rgb;
	}

	function convertToHex2(value:String):Int {
		var _color = (Std.parseInt(value.replace('#', '0x')));
		return _color;
	}
}
