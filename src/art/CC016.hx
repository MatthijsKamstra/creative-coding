package art;

/**
 * short description what this does
 */
class CC016 extends CCBase implements ICCBase {

	var shapeArray : Array<CircleExtra> = [];
	var shapeMax : Int = 200;

	var _radius = 150;
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
			radius: _radius, // offset of
			size: _size, // size of circles
			angle: i*1, // steps for rotation
			speed: 4, // rotation speed
		}
		return shape;
	}

	function drawShape(){
		for ( i in 0 ... shapeArray.length ) {
			var sh = shapeArray[i];
			sh.angle -= sh.speed;
			// plot the balls x to cos and y to sin
			sh.x = w/2 + Math.cos(radians(untyped sh.angle))*sh.radius;
			sh.y = h/2 + Math.sin(radians(untyped sh.angle))*sh.radius;
			ctx.fillStyle = getColourObj(sh.rgb, sh.alpha);
			ctx.circle(sh.x, sh.y, sh.size);
		}
	}

	override function setup(){
		trace('setup: ${toString()}');
		for ( i in 0 ... shapeMax ) {
			shapeArray.push(createShape(i));
		}
	}

	override function draw(){
		// trace('draw: ${toString()}');
		ctx.clearRect(0,0,w,h);
		// ctx.backgroundObj(BLACK);
		drawShape();
		// stop();
	}
}