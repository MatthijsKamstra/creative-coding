package art;

/**
 * short description what this does
 */
class CC016 extends CCBase implements ICCBase {

	var shapeArray : Array<CircleExtra> = [];
	var arr : Array<Array<CircleExtra>> = [];
	var shapeMax : Int = 25;

	var _size = 50;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Circle with trail';


		super(ctx);
	}

	function createShape(i:Int){
		var shape : CircleExtra = {
			_id: '$i',
			_type: 'circle',
			x: w/2,
			y: h/2,
			rgb: BLACK,
			alpha: 1 - (i * (1/shapeMax)),
			radius: 20,
			size: 10,
			angle: i*10,
			speed: 4,
		}
		return shape;
	}

	function drawShape(){
		var grid = new GridUtil();
		// grid.setCellSize(_size);
		grid.setIsCenterPoint(true);
		// grid.setNumbered(10,10);
		grid.setNumbered(2,2);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}
		for ( j in 0 ... grid.array.length ) {
			var point = grid.array[j];
			for ( i in 0 ... shapeArray.length ) {
				var sh = shapeArray[i];
				sh.angle -= sh.speed;
				// plot the balls x to cos and y to sin
				// sh.x = w/2 + Math.cos(radians(untyped sh.angle))*sh.radius;
				// sh.y = h/2 + Math.sin(radians(untyped sh.angle))*sh.radius;
				sh.x = point.x + Math.cos(radians(untyped sh.angle))*sh.radius;
				sh.y = point.y + Math.sin(radians(untyped sh.angle))*sh.radius;
				ctx.fillStyle = getColourObj(sh.rgb, sh.alpha);
				ctx.circle(sh.x, sh.y, sh.size);
			}
		}
	}


	override function setup(){
		trace('init: ${toString()}');


		trace(isDebug);
		isDebug = true;
		trace(isDebug);



		for ( i in 0 ... shapeMax ) {
			shapeArray.push(createShape(i));
		}
		// console.table(shapeArray);

		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w/2, h/2, 200);
	}

	override function draw(){
		// trace('draw: ${toString()}');
		ctx.clearRect(0,0,w,h);
		// ctx.backgroundObj(BLACK);


		drawShape();

		// stop();
	}
}