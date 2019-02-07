package art;

/**
 * short description what this does
 */
class CC022 extends CCBase implements ICCBase {

	var shapeArray : Array<CircleExtra> = [];
	var shapeMax : Int = 10;

	var _bgColor : RGB = null;
	var _lineColor : RGB = null;
	var _fillColor : RGB = null;

	var _xmax = 50;

	var maxDistance = w/2;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function createShape(i:Int, ?point:Point){
		var _angle = (360/_xmax)*i;
		var shape : CircleExtra = {
			_id: '$i',
			_type: 'circle',
			radius: h/2,
			angle: _angle,
			x: (w/_xmax) * i,
			y: (h/2),
		}
		// onAnimateHandler(shape);
		return shape;
	}

	// function onAnimateHandler(circle:Circle){
	// 	// GoJs.to(circle, 5).x(w/2).y(h/2).ease(lets.easing.Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	// }

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(_bgColor);

		ctx.strokeColourObj(_lineColor);
		for ( i in 0 ... shapeArray.length ) {
			var sh = shapeArray[i];
			sh.angle += 1;
			sh.y = (h/2) + Math.sin(radians(sh.angle)) * h/3;
			ctx.strokeColourObj(_lineColor,0);
			ctx.strokeCircle(sh.x, sh.y, 10);

			for (j in 0...shapeArray.length) {
				var b2 = shapeArray[j];
				if (sh == b2) continue;
				var _dist = distance(sh.x, sh.y, b2.x, b2.y);
				// trace('-----\n ${line} / ${b2} -- ${_dist}');
				if (_dist < maxDistance) {
					var alpha:Float = 0.8 - (_dist / maxDistance); // 0.5
					// trace(alpha);
					// alpha = 1;
					ctx.lineColour(_fillColor.r, _fillColor.g, _fillColor.b, alpha);
					ctx.line(sh.x, sh.y, b2.x, b2.y);
				}
			}
		}
	}


	override function setup(){
		// trace('setup: ${toString()}');

		var colorArray = lib.util.ColorUtil.niceColor100[randomInt(lib.util.ColorUtil.niceColor100.length)];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[3]);
		_fillColor = hex2RGB(colorArray[2]);

		// isDebug = true;

		for ( i in 0 ... _xmax ) {
			shapeArray.push(createShape(i));
		}

		// console.table(shapeArray);

	}

	override function draw(){
		trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}