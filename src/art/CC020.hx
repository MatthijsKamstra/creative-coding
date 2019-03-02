package art;

/**
 * short description what this does
 */
class CC020 extends CCBase implements ICCBase {

	var shapeArray : Array<Arc> = [];
	var _radius = 150;

	var _bgColor : RGB = null;
	var _lineColor : RGB = null;
	var _lineColor2 : RGB = null;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function createShape(i:Int, ?point:Point){
		var shape : Arc = {
			_id: '$i',
			_type: 'arc',
			x: w/2,
			y: h/2,
			radius:_radius,
			rotation:0,
			angle: 250,
			speed: 1,
		}
		// onAnimateHandler(shape);
		return shape;
	}

	// function onAnimateHandler(arc:Arc){
	// 	Go.to(arc, random).x(w/2).y(h/2).ease(Sine.easeInOut).onComplete(onAnimateHandler, [arc]);
	// }

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(_bgColor);
		for ( i in 0 ... shapeArray.length ) {
			var sh = shapeArray[i];
			sh.rotation += sh.speed + (i*1);
			ctx.beginPath();
			ctx.strokeStyle = getColourObj(_lineColor);
			if(i == 0) ctx.strokeStyle = getColourObj(_lineColor2);
			ctx.lineCap = 'round';
			ctx.lineWidth = 30;
			ctx.arc(w/2, h/2, sh.radius * (0.6*i+1), radians(0 + sh.rotation), radians(sh.angle + sh.rotation));
			ctx.stroke();
		}
	}


	override function setup(){
		trace('setup: ${toString()}');
		var colorArray = ColorUtil.niceColor100[randomInt(ColorUtil.niceColor100.length-1)];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[1]);
		_lineColor2 = hex2RGB(colorArray[2]);

		shapeArray.push(createShape(0));
		shapeArray.push(createShape(1));
	}

	override function draw(){
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}