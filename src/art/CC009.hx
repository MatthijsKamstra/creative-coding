package art;

/**
 * short description what this does
 */
class CC009 extends CCBase implements ICCBase {

	var shapeMax = 1000;
	var shapeSize = 15;
	var shapeArray : Array<AnimateObj> = [];

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = 'Stars in the sky';
		// trace(description);
	}

	function createShape() : AnimateObj{
		var shape : AnimateObj = {
			x: w/2,
			y: h/2,
			size: 1,
			alpha: 0,
			color: getColourObj (WHITE),
		}
		Reflect.setField(shape,'r', WHITE.r);
		Reflect.setField(shape,'g', WHITE.g);
		Reflect.setField(shape,'b', WHITE.b);
		onCompleteHandler(shape);
		return shape;
	}

	function point() : Point{
		var _x = random(-w, w*3);
		var _y = random(-h, h*3);
		if(_x>0 && _x<w && _y>0 && _y<h ){
			_x += w;
		}
		return {x:_x,y:_y};
	}


	function onCompleteHandler(shape:AnimateObj){
		shape.x = w/2;
		shape.y = h/2;
		shape.size = 1;
		shape.alpha = 0;
		var point = point();
		var time = random(2);
		Go.to(shape, time).x(point.x).y(point.y).alpha(1).prop('size',randomInt(10)).ease(Sine.easeInOut).delay(time).onComplete(onCompleteHandler,[shape]);
	}

	function drawShape(){
		for ( i in 0 ... shapeArray.length ) {
			var sh = shapeArray[i];
			// ctx.fillStyle = sh.color;
			ctx.fillStyle = getColour(untyped sh.r, untyped sh.g, untyped sh.b, sh.alpha);
			ctx.circle(sh.x, sh.y, sh.size);
		}
	}

	override function setup(){
		shapeArray = [];
		for (i in 0...shapeMax){
			var sh = createShape();
			shapeArray.push( sh );
		}
	}

	override function draw(){
		// trace('draw: ${toString()}');
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(BLACK);
		drawShape();
		// stop();
	}
}