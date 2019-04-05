package art;

/**
 * short description what this does
 */
class CC068 extends CCBase implements ICCBase {
	var shapeArray:Array<Square> = [];
	var grid:GridUtil = new GridUtil();
	var grid2:GridUtil = new GridUtil();
	// sizes
	var _radius = 150;
	var _cellsize = 150;
	var aniCounter:Int;
	var aniMax = 0;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Bigger as a group, then when you are single';
		type = [CCType.ANIMATION, CCType.IMAGE];

		super(ctx);
	}

	function createShape(i:Int, ?point:Point) {
		var shape:Square = {
			_id: '$i',
			_type: 'Square',
			x: point.x,
			y: point.y,
		}
		onAnimateHandler(shape, i);
		return shape;
	}

	var startT:Float;
	var endT:Float;

	function onAnimateHandler(sh:Square, i:Int) {
		if (aniCounter == null) {
			trace('export start');
			startT = Date.now().getTime();
			aniCounter = 0;
		}
		if (aniCounter == (aniMax * 1)) {
			endT = Date.now().getTime();
			trace('export stop (${(endT - startT) / 1000} sec)');
		}
		var sh2 = grid2.array[i];
		aniCounter++;
		Go.to(sh, 5)
			.delay(1.5)
			.pos(sh2.x, sh2.y)
			.yoyo()
			.ease(Sine.easeInOut)
			.onComplete(onAnimateHandler, [sh, i]);
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
			ShapeUtil.gridField(ctx, grid2);
		}

		var _color = WHITE;
		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.fillColourRGB(_color);
			ctx.shadowSet(BLACK, 0.2, 15);
			ctx.centreFillRect(sh.x, sh.y, grid.cellWidth, grid.cellHeight);
		}
		// real square
		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.fillColourRGB(_color);
			ctx.shadowBlur = 0;
			ctx.centreFillRect(sh.x, sh.y, grid.cellWidth, grid.cellHeight);
		}
	}

	override function setup() {
		trace('setup: ${toString()}');
		var padding = w * .3;
		// isDebug = true;
		// grid 1
		grid.setDimension(w - padding, h - padding);
		grid.setNumbered(3, 3);
		grid.setIsCenterPoint(true);
		// grid 2
		grid2.setDimension(w, h);
		grid2.setNumbered(3, 3);
		grid2.setIsCenterPoint(true);
		//
		aniMax = grid.array.length;
		//
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
}
