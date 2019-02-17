package art;

/**
 * short description what this does
 */
class CC037 extends CCBase implements ICCBase {
	var shapeArray:Array<Polygon> = [];
	var grid:GridUtil = new GridUtil();
	// var shapeMax = 100;
	var cellsize = 20;
	var maxSides = 6;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function createShape(i:Int) {
		var shape:Polygon = {
			_id: '$i',
			_type: 'polygon',
			x: 0,
			y: 0,
			sides: maxSides,
			size: cellsize
		}
		return shape;
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		// https://nl.wikipedia.org/wiki/Sinusregel
		var hoek = 360 / maxSides;
		var hoek_2 = radians(hoek / 2);
		var horDistSin = Math.sin(hoek_2) * cellsize;
		var horDistCos = Math.cos(hoek_2) * cellsize;
		var horDistTan = Math.tan(hoek_2) * cellsize;

		trace('schuine zijde: $cellsize');
		trace('- horDistSin: $horDistSin');
		trace('> horDistCos: $horDistCos');
		trace('- horDistTan: $horDistTan');

		trace((lib.util.MathUtil.pythagoreanTheorem(0, horDistCos, cellsize)));

		// var distX = cellsize + (lib.util.MathUtil.pythagoreanTheorem(0,horDistCos,cellsize));
		var distX = cellsize + horDistSin;
		var distY = horDistCos;

		grid.setIsFullscreen();
		// grid.setDimension(w, h);
		// grid.setPosition(0, 0);
		grid.setCellSize(distX, distY);
		grid.setIsCenterPoint(true);

		for (i in 0...grid.array.length) {
			shapeArray.push(createShape(i));
		}

		trace('w: ${w}, h: ${h}');
		trace('total: ${grid.array.length}');
		trace('numHor: ${grid.numHor}, numVer: ${grid.numVer}');
		trace('width: ${grid.width}, height: ${grid.height}');
		trace('x: ${grid.x}, y: ${grid.y}');

		var startX:Float = grid.x;
		var startY:Float = grid.y;

		var gridCounterY = 0;
		var gridCounterX = 0;

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			sh.x = startX + (gridCounterX * (distX));
			sh.y = startY + (gridCounterY * (distY * 2));
			ctx.strokeColourRGB(BLACK);
			ctx.fillColourRGB(randomColourObject());
			// ctx.strokePolygon(sh.x, sh.y, sh.sides, sh.size);
			ctx.outlinedPolygon(sh.x, sh.y, sh.sides, sh.size, getColourObj(randomColourObject()), getColourObj(BLACK));
			gridCounterY++;
			if (gridCounterY >= grid.numHor) {
				gridCounterX++;
				gridCounterY = 0;
				startX = grid.x;
				if ((gridCounterX % 2) == 1) {
					startY = grid.y + distY;
				} else {
					startY = grid.y;
				}
			}
		}

		if (isDebug) {
			// ShapeUtil.gridDots(ctx, grid);
			ShapeUtil.gridField(ctx, grid);
		}
	}

	override function setup() {
		trace('setup: ${toString()}');
		// isDebug = true;
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
