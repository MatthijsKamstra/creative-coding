package art;

/**
 * short description what this does
 */
class CC022 extends CCBase implements ICCBase {

	var shapeArray : Array<Rectangle> = [];
	var shapeMax : Int = 10;

	var _bgColor : RGB = null;
	var _lineColor : RGB = null;
	var _fillColor : RGB = null;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function createShape(i:Int, ?point:Point){
		var shape : Rectangle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
		}
		// onAnimateHandler(shape);
		return shape;
	}

	// function onAnimateHandler(circle:Rectangle){
	// 	// GoJs.to(circle, 5).x(w/2).y(h/2).ease(lets.easing.Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	// }

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(_bgColor);



		// ctx.fillColourRGB(BLACK,10);
		ctx.strokeColourObj(_lineColor);
		ctx.strokeWeight(15);
		// for ( i in 0 ... shapeArray.length ) {
		// 	var rectangle : Rectangle = shapeArray[i];
		// 	var size = _size * 0.8;
		// 	var radiusMax = _size/2;
		// 	var temp = (radiusMax/shapeArray.length)*i;
		// 	ctx.fillColourRGB(_lineColor);
		// 	ctx.roundRect(rectangle.x, rectangle.y, size, size, temp);
		// }
	}


	override function setup(){
		// trace('setup: ${toString()}');
		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w/2, h/2, 200);

		var colorArray = lib.util.ColorUtil.niceColor100[randomInt(lib.util.ColorUtil.niceColor100.length)];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[1]);
		_fillColor = hex2RGB(colorArray[2]);

		// isDebug = true;



	}

	override function draw(){
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}