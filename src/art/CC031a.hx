package art;

/**
 * short description what this does
 */
class CC031a extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var minRadius = 10;
	var maxRadius = 35;
	var cellsize = 50;
	var maxDistance = 300;

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
			rgb: BLACK
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
			ctx.fillColourRGB(sh.rgb);
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

		/*
			var count = Math.round(grid.array.length / 2);
			var b2 = shapeArray[count];
			var originalpoint = grid.array[count];
			b2.rgb = PINK;

			// var currentDistance = distance(point.x, point.y, b2.x, b2.y);

			// trace('point / '+dist(point.x, point.y, b2.x, b2.y));
			// trace(dist(point.x, point.y, b2.x, b2.y));
			// trace('b2 /'+dist(b2.x, b2.y, point.x, point.y));


			var currentDistance = (dist(b2.x, b2.y, point.x, point.y));
			// trace('-----\n ${point} / ${b2} -- ${currentDistance}');
			// trace('${currentDistance}');

			if(currentDistance < maxDistance){
				// trace('${maxDistance} / ${currentDistance} = ${currentDistance/ maxDistance }');

				var scale = 1 - (currentDistance/ maxDistance );
				var xoff = b2.x - point.x;
				var yoff = b2.y - point.y;


				b2.x = originalpoint.x + (xoff * scale);
				b2.y = originalpoint.y + (yoff * scale);
			} else {
				b2.x = originalpoint.x ;
				b2.y = originalpoint.y ;

			}


			return; //

		 */

		for (j in 0...shapeArray.length) {
			var b2 = shapeArray[j];
			var originalpoint = grid.array[j];
			if (point == b2)
				continue;
			var currentDistance = distance(point.x, point.y, b2.x, b2.y);
			// trace('-----\n ${line} / ${b2} -- ${currentDistance}');
			if (currentDistance < maxDistance) {
				var scale = 1 - (currentDistance / maxDistance);
				var xoff = b2.x - point.x;
				var yoff = b2.y - point.y;
				b2.x = originalpoint.x + (xoff * scale);
				b2.y = originalpoint.y + (yoff * scale);
				// b2.rgb = PINK;
			} else {
				b2.x = originalpoint.x;
				b2.y = originalpoint.y;
				b2.rgb = BLACK;
				// b2.radius = minRadius;
			}
		}
	}

	function onAnimateHandler(circle:Circle) {
		// Go.to(circle, 5).x(w/2).y(h/2).ease(Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	}
}
