package art;

/**
 * short description what this does
 */
class CC020 extends CCBase implements ICCBase {

	var shapeArray : Array<Circle> = [];
	var _radius = 150;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function createShape(i:Int, ?point:Point){
		var shape : Circle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
			radius:_radius,
		}
		onAnimateHandler(shape);
		return shape;
	}

	function onAnimateHandler(circle:Circle){
		// GoJs.to(circle, 5).x(w/2).y(h/2).ease(lets.easing.Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	}

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(WHITE);
		for ( i in 0 ... shapeArray.length ) {
		}
	}


	override function setup(){
		trace('setup: ${toString()}');
		var rgb = randomColourObject();
		ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		ctx.xcross(w/2, h/2, 200);
	}

	override function draw(){
		trace('draw: ${toString()}');
		// drawShape();
		stop();
	}
}