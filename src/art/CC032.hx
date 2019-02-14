package art;

/**
 * short description what this does
 */
class CC032 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var _rotation = 0.0;
	var _speed = 0.5;
	var cellsize = 150;
	var delaycounter = 0.0;
	var totalCounter = 100;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function arrowConverter(size):Array<Point> {
		var _w = size;
		var _h = size;
		var pointArray:Array<Point> = [];
		pointArray.push({x: _w / 2, y: 0});
		pointArray.push({x: _w, y: _h / 2});
		pointArray.push({x: _w - (_w / 4), y: _h / 2});
		pointArray.push({x: _w - (_w / 4), y: _h});
		pointArray.push({x: (_w / 4), y: _h});
		pointArray.push({x: (_w / 4), y: _h / 2});
		pointArray.push({x: 0, y: _h / 2});
		return pointArray;
	}

	function arrowDraw(pointArray:Array<Point>, pos:Point) {
		ctx.save();
		ctx.translate(pos.x + cellsize / 2, pos.y + cellsize / 2);
		ctx.rotate(radians(_rotation));

		ctx.beginPath();
		ctx.fillColourRGB(WHITE);
		for (i in 0...pointArray.length) {
			var _point = pointArray[i];
			_point.x -= cellsize / 2;
			_point.y -= cellsize / 2;
			if (i == 0) {
				ctx.moveTo(_point.x, _point.y);
			} else {
				ctx.lineTo(_point.x, _point.y);
			}
		}
		ctx.fill();
		ctx.closePath();
		ctx.restore();
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(BLACK);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}
		for (i in 0...grid.array.length) {
			var gridPoint:Point = grid.array[i];
			var pointArray:Array<Point> = arrowConverter(cellsize);
			arrowDraw(pointArray, gridPoint);
		}

		if (Math.round(_rotation) == 360)
			_rotation = 0;
		if (Math.round(_rotation) == 0 || Math.round(_rotation) == 90 || Math.round(_rotation) == 180 || Math.round(_rotation) == 270) {
			delaycounter++;
			if (delaycounter >= totalCounter) {
				delaycounter = 0;
				_rotation += _speed;
			}
			return;
		}
		_rotation += _speed;
	}

	// ____________________________________ override ____________________________________
	override function setup() {
		trace('setup: ${toString()}');

		// isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// grid.setNumbered(3,3);
		grid.setCellSize(cellsize);
		// grid.setIsCenterPoint(true);
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
