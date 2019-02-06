package art;

/**
 * short description what this does
 */
class CC019 extends CCBase implements ICCBase {

	var shapeArray : Array<Circle> = [];
	var shapeMax : Int = 10;
	var grid = new GridUtil();

	var _size = 75;
	var _radius = 150;

	var _bgColor : RGB = null;
	var _lineColor : RGB = null;

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

		if(i!=4) {
			onAnimateHandler(shape);
			// shape.radius = 10;
		}
		return shape;
	}

	function drawShape(){

		ctx.backgroundObj(_bgColor);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		// ctx.fillColourRGB(BLACK,10);
		ctx.strokeColourObj(_lineColor);
		ctx.strokeWeight(15);
		for ( i in 0 ... shapeArray.length ) {
			var circle : Circle = shapeArray[i];
			ctx.strokeCircle(circle.x, circle.y, circle.radius);
		}

	}

	function onAnimateHandler(circle:Circle){
		for ( i in 0 ... shapeArray.length ) {
			var circle : Circle = shapeArray[i];
			var point = grid.array[i];
			circle.x = point.x;
			circle.y = point.y;
		}
		GoJs.to(circle, 5).x(w/2).y(h/2).ease(lets.easing.Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	}

	override function setup(){
		var colorArray = lib.util.ColorUtil.niceColor100[randomInt(lib.util.ColorUtil.niceColor100.length)];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[1]);

		// isDebug = true;

		grid.setDimension(w*2.1, h*2.1);
		grid.setNumbered(3,3);
		grid.setIsCenterPoint(true);

		for ( i in 0 ... grid.array.length ) {
			var point : Point = grid.array[i];
			shapeArray.push(createShape(i, point));
		}

	}

	override function draw(){
		// trace('draw: ${toString()}');
		ctx.clearRect(0,0,w,h);
		drawShape();
		// stop();
	}
}