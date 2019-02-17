package art;

/**
 * short description what this does
 */
class CC017 extends CCBase implements ICCBase {
	var shapeArray:Array<CircleExtra> = [];
	var arr:Array<Array<CircleExtra>> = [[]];
	var shapeMax:Int = 25;
	var _size = 75;
	var grid = new GridUtil();

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Circles with trail';
		super(ctx);
	}

	function createShape(i:Int, j:Int) {
		var shape:CircleExtra = {
			_id: '$i',
			_type: 'circle',
			x: w / 2,
			y: h / 2,
			rgb: WHITE,
			alpha: 1 - (i * (1 / shapeMax)),
			radius: 20,
			size: 10,
			// angle: (i * 10)*j,
			angle: (j * 10) + (i * 10),
			speed: 4,
		}
		return shape;
	}

	function drawShape() {

		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(BLACK);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		for (j in 0...grid.array.length) {
			var point = grid.array[j];
			for (i in 0...arr[j].length) {
				var sh = arr[j][i];
				sh.angle -= sh.speed;
				// plot the balls x to cos and y to sin
				// sh.x = w/2 + Math.cos(radians(untyped sh.angle))*sh.radius;
				// sh.y = h/2 + Math.sin(radians(untyped sh.angle))*sh.radius;
				sh.x = point.x + Math.cos(radians(untyped sh.angle)) * sh.radius;
				sh.y = point.y + Math.sin(radians(untyped sh.angle)) * sh.radius;
				ctx.fillStyle = getColourObj(sh.rgb, sh.alpha);
				ctx.circle(sh.x, sh.y, sh.size);
			}
		}
		// for ( j in 0 ... grid.array.length ) {
		// 	var point = grid.array[j];
		// 	for ( i in 0 ... shapeArray.length ) {
		// 		var sh = shapeArray[i];
		// 		sh.angle -= sh.speed;
		// 		// plot the balls x to cos and y to sin
		// 		// sh.x = w/2 + Math.cos(radians(untyped sh.angle))*sh.radius;
		// 		// sh.y = h/2 + Math.sin(radians(untyped sh.angle))*sh.radius;
		// 		sh.x = point.x + Math.cos(radians(untyped sh.angle))*sh.radius;
		// 		sh.y = point.y + Math.sin(radians(untyped sh.angle))*sh.radius;
		// 		ctx.fillStyle = getColourObj(sh.rgb, sh.alpha);
		// 		ctx.circle(sh.x, sh.y, sh.size);
		// 	}
		// }
	}



	override function setup() {
		trace('init: ${toString()}');

		grid.setCellSize(_size);
		grid.setIsCenterPoint(true);
		// grid.setNumbered(10,10);
		// grid.setNumbered(2,2);

		// isDebug = true;

		for (j in 0...grid.array.length) {
			arr.push([]);
			for (i in 0...shapeMax) {
				arr[j].push(createShape(i,j));
			}
		}
	}

	override function draw() {
		// trace('draw: ${toString()}');
		ctx.clearRect(0, 0, w, h);
		drawShape();
		// stop();
	}
}
