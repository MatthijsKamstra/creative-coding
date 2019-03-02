package art;

/**
 * short description what this does
 */
class CC033 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var cellsize = 50;
	// var _rotation = 0.0;
	// var _speed = 0.5;
	// var delaycounter = 0.0;
	// var totalCounter = 100;
	var clientX:Int;
	var clientY:Int;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Arrows following mouse';
		type = [CCType.INTERACTIVE];
		super(ctx);
		window.addEventListener("mousemove", onMouseMoveHandler);
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

		// [mck] hacky, but it gets the job done!
		var _rotation = MathUtil.angle(pos.x+cellsize/2, pos.y+cellsize/2, clientX, clientY);
		// trace(angle2);

		ctx.save();
		ctx.translate(pos.x + cellsize / 2, pos.y + cellsize / 2);
		ctx.rotate(radians(_rotation+90));

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

	// ____________________________________ handler ____________________________________

	function onMouseMoveHandler(e:js.html.MouseEvent) {
		// trace(e.clientX, e.clientY);
		var point:Point = {
			x: e.clientX,
			y: e.clientY
		}

		clientX = e.clientX;
		clientY = e.clientY;

		// var gridP = grid.array[0];
		// // var angle = MathUtil.angle(point.x, point.y, gridP.x, gridP.y);
		// // trace(angle);
		// var angle2 = MathUtil.angle(gridP.x, gridP.y, point.x, point.y);
		// trace(angle2);
	}

}
