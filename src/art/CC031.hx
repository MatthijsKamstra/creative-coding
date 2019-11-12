package art;

/**
 * short description what this does
 */
class CC031 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var minRadius = 10;
	var maxRadius = 35;
	var cellsize = 50;
	var maxDistance = h;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Circles react to mouse';
		super(ctx);
	}

	function createShape(i:Int, ?point:Point) {
		var shape:Circle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
			radius: minRadius,
		}
		onAnimateHandler(shape);
		return shape;
	}

	// ____________________________________ shape creation ____________________________________
	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		if (isDebug) {
			ShapeUtil.gridDots(ctx, grid);
		}

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			ctx.fillColourRGB(BLACK);
			ctx.fillCircle(sh.x, sh.y, sh.radius);
		}
		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w / 2, h / 2, 200);
	}

	// ____________________________________ override ____________________________________
	override function setup() {
		trace('setup: ${toString()}');

		shapeArray = [];

		// isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// grid.setNumbered(3,3);
		grid.setCellSize(cellsize);
		grid.setIsCenterPoint(true);

		for (i in 0...grid.array.length) {
			var point = grid.array[i];
			shapeArray.push(createShape(i, point));
		}

		window.addEventListener("mousemove", onMouseMoveHandler);
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
		for (j in 0...shapeArray.length) {
			var b2 = shapeArray[j];
			if (point.x == b2.x && point.y == b2.y)
				continue;
			var currentDistance = distance(point.x, point.y, b2.x, b2.y);
			// trace('-----\n ${line} / ${b2} -- ${currentDistance}');
			if (currentDistance < maxDistance) {
				console.log('minRadius: $minRadius');
				console.log('maxRadius: $maxRadius');
				console.log('(maxRadius / minRadius): ($maxRadius / $minRadius) -> ${(maxRadius / minRadius)}');
				console.log('(maxDistance / currentDistance): ($maxDistance / $currentDistance) -> ${(maxDistance / currentDistance)}');

				// var alpha:Float = 0.8 - (currentDistance / maxDistance); // 0.5
				// b2.radius = alpha;
				// b2.radius = minRadius + ((maxRadius / minRadius) * (maxDistance / currentDistance));
				// b2.radius = maxRadius - (minRadius + ((currentDistance/maxDistance) * (maxRadius-minRadius))) ;
				b2.radius = maxRadius - ((currentDistance / maxDistance) * (maxRadius - minRadius));
			} else {
				b2.radius = minRadius;
			}
		}
	}

	function onAnimateHandler(circle:Circle) {
		// Go.to(circle, 5).x(w/2).y(h/2).ease(Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	}
}
