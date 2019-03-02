package art;

/**
 * short description what this does
 */
class CC021 extends CCBase implements ICCBase {

	var shapeArray : Array<Rectangle> = [];
	var shapeMax : Int = 10;
	var grid = new GridUtil();

	var _size = 75;
	var _radius = 150;

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
	// 	// Go.to(circle, 5).x(w/2).y(h/2).ease(Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	// }

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(_bgColor);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		// ctx.fillColourRGB(BLACK,10);
		ctx.strokeColourObj(_lineColor);
		ctx.strokeWeight(15);
		for ( i in 0 ... shapeArray.length ) {
			var rectangle : Rectangle = shapeArray[i];
			var size = _size * 0.8;
			var radiusMax = _size/2;
			var temp = (radiusMax/shapeArray.length)*i;
			ctx.fillColourRGB(_lineColor);
			ctx.roundRect(rectangle.x, rectangle.y, size, size, temp);
		}
	}


	override function setup(){
		// trace('setup: ${toString()}');
		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w/2, h/2, 200);

		var colorArray = ColorUtil.niceColor100[randomInt(ColorUtil.niceColor100.length-1)];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[1]);
		_fillColor = hex2RGB(colorArray[2]);

		// isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// grid.setNumbered(3,3);
		grid.setCellSize(_size);
		grid.setIsCenterPoint(true);

		for ( i in 0 ... grid.array.length ) {
			var point : Point = grid.array[i];
			shapeArray.push(createShape(i, point));
		}

	}

	override function draw(){
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}