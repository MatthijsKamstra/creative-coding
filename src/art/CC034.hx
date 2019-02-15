package art;

/**
 * short description what this does
 */
class CC034 extends CCBase implements ICCBase {

	var shapeArray : Array<CircleExtra> = [];
	var shapeMax : Int = 25;

	var maxRadius = h/3;
	var minRadius = 100;
	var maxCircleSize = 30;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Circles in a circle';
		type = [CCType.ANIMATION];
		super(ctx);
	}

	function createShape(i:Int){
		var shape : CircleExtra = {
			_id: '$i',
			_type: 'circle',
			x: w/2,
			y: h/2,
			rgb: BLACK,
			radius: maxRadius + (i * (minRadius/shapeMax)), // offset of
			size: (maxCircleSize/shapeMax)*i, // size of circles
			angle: (360/shapeMax)*i, // steps for rotation
			speed: 1, // rotation speed
		}
		return shape;
	}

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		for ( i in 0 ... shapeArray.length ) {
			var sh = shapeArray[i];
			// sh.radius += i*5;
			sh.angle += sh.speed;
			// plot the balls x to cos and y to sin
			sh.x = w/2 + Math.cos(radians(sh.angle))*sh.radius;
			sh.y = h/2 + Math.sin(radians(sh.angle))*sh.radius;
			// ctx.fillStyle = getColourObj(sh.rgb, sh.alpha);
			ctx.fillStyle = getColourObj(sh.rgb);
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
		drawShape();
		// stop();
	}
}