package art;

/**
 * short description what this does
 */
class CC015 extends CCBase implements ICCBase {

	var shapeArray : Array<Point> = [];

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function createShape(){
		var shape : AnimateObj = {
			x: w/2,
			y: h/2,
			size: 50,
			alpha: 1,
			color: getColourObj (FUCHSIA),
			type: 'ball'
		}
		Reflect.setField(shape,'r', FUCHSIA.r);
		Reflect.setField(shape,'g', FUCHSIA.g);
		Reflect.setField(shape,'b', FUCHSIA.b);
		Reflect.setField(shape,'angle', 0);
		return shape;
	}

	function drawShape(){
		for ( i in 0 ... shapeArray.length ) {
		}
	}


	override function init(){
		trace('init: ${toString()}');
		var rgb = randomColourObject();
		ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		ctx.xcross(w/2, h/2, 200);
	}

	override function draw(){
		trace('draw: ${toString()}');
		// ctx.clearRect(0,0,w,h);
		// ctx.backgroundObj(BLACK);
		stop();
	}
}