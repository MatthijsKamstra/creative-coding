package art;

import lib.util.ColorUtil;
import mloader.Loader;
import mloader.JsonLoader;

/**
 * short description what this does
 */
class CC029 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var loader:JsonLoader<Dynamic>;
	var colorArr:Array<Array<String>> = [];
	var _radius = 150;
	var _cellsize = 150;
	var _bgColor:RGB = null;
	var _lineColor:RGB = null;
	var _fillColor:RGB = null;
	var _lineColor2:RGB = null;
	var _fillColor2:RGB = null;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Show 1000 sorted colors';
		colorArr = ColorUtil.niceColor100SortedString;

		super(ctx);

		// loading gigantic 1000.json file with arrays
		loader = new JsonLoader<Dynamic>('assets/sorted_1000.json');
		// loader = new JsonLoader<Dynamic>('assets/1000.json');
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
				trace(event.target.content.length);
				colorArr = cast event.target.content;
				drawShape();
			default:
		}
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		if (isDebug) {
			ShapeUtil.gridDots(ctx, grid);
		}

		for (i in 0...colorArr.length) {
			var colorArray = colorArr[i];
			trace(colorArray);

			var point:Point = grid.array[i];

			var color0 = hex2RGB(colorArray[0]);
			var color1 = hex2RGB(colorArray[1]);
			var color2 = hex2RGB(colorArray[2]);
			var color3 = hex2RGB(colorArray[3]);
			var color4 = hex2RGB(colorArray[4]);
			var _colorA = [color0, color1, color2, color3, color4];
			for (j in 0..._colorA.length) {
				var px = 1;

				var _w = Math.floor((grid.cellWidth - px) / _colorA.length);
				var offsetX = j * _w;
				// ctx.strokeColourRGB(_colorA[j]);
				// ctx.strokeWeight(_w);
				ctx.fillColourRGB(_colorA[j]);
				ctx.fillRect(offsetX + point.x, point.y, _w, grid.cellHeight - px);
			}
		}
	}

	override function setup() {
		// trace('setup: ${toString()}');
		// isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		grid.setNumbered(32, 32);
		// grid.setCellSize(_cellsize);
		// grid.setIsCenterPoint(true);
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
