package art;

import lib.util.ColorUtil;
import mloader.Loader;
import mloader.JsonLoader;

/**
 * short description what this does
 */
class CC013 extends CCBase implements ICCBase {
	var shapeArray:Array<Point> = [];
	var loader:JsonLoader<Dynamic>;
	var colorArr:Array<Array<String>> = [];

	public function new(ctx:CanvasRenderingContext2D) {
		colorArr = ColorUtil.niceColor200;
		description = 'Create simple pattern with colors';

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
				draw();
			default:
		}
	}

	function create() {
		// isDebug = true;
		var _size = 50;
		var _x = 0;
		var _y = 0;
		var _numHor = Math.round(w / _size) + 1;
		var _numVer = Math.round(h / _size) + 1;
		// var arr:Array<Point> = GridUtil.create(_x, _y, w - (2 * _x), h - (2 * _y), _numHor, _numVer);
		var grid = new GridUtil();
		grid.setCellSize(_size);

		// trace('x: ${grid.x}, y: ${grid.y}');
		// trace('w: ${w}, h: ${h}');
		// trace('width: ${grid.width}, height: ${grid.height}');
		// trace('cellWidth: ${grid.cellWidth}, cellHeight: ${grid.cellHeight}');
		// trace('numHor: ${grid.numHor}, numVer: ${grid.numVer}');
		// trace('numHor * numVer: ${grid.numHor * grid.numVer}');
		// trace('array: ${grid.array.length}');
		// console.table(grid.array);
		// trace(grid.x);

		if (isDebug) {
			ShapeUtil.gridRegister(ctx, grid.array);
			ctx.strokeRect(grid.x, grid.y, grid.width, grid.height);
		}

		var colorCounter = 0;
		for (i in 0...grid.array.length) {
			var p:Point = grid.array[i];

			colorCounter++;
			if (colorCounter >= colorArr.length) {
				colorCounter = 0;
			}
			var colorArray = colorArr[colorCounter];
			// trace(ColorUtil.hex2RGB(colorArray[0]));
			// trace('${i}, ${colorCounter}');
			// trace(colorArray);
			// trace(colorArray[0]);

			ctx.colourObj(ColorUtil.hex2RGB(colorArray[0]));
			ctx.fillRect(p.x, p.y, _size, _size);

			ctx.colourObj(ColorUtil.hex2RGB(colorArray[1]));
			ctx.fillCircle(p.x + _size / 2, p.y + _size / 2, (_size / 2) * 0.8);

			ctx.colourObj(ColorUtil.hex2RGB(colorArray[2]));
			ctx.fillCircle(p.x + _size / 2, p.y + _size / 2, (_size / 2) * 0.6);

			ctx.colourObj(ColorUtil.hex2RGB(colorArray[3]));
			ctx.fillCircle(p.x + _size / 2, p.y + _size / 2, (_size / 2) * 0.4);

			ctx.colourObj(ColorUtil.hex2RGB(colorArray[4]));
			ctx.fillCircle(p.x + _size / 2, p.y + _size / 2, (_size / 2) * 0.2);
		}
	}

	override function draw() {
		trace('draw: ${toString()}');
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(WHITE);
		create();
		stop();
	}
}
