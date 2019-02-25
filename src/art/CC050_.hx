package art;

/**
 * short description what this does
 */
class CC042 extends CCBase implements ICCBase {

	var shapeArray : Array<Circle> = [];
	var grid : GridUtil = new GridUtil();

	var _radius = 150;
	var _cellsize = 150;
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);
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


		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		for ( i in 0 ... shapeArray.length ) {
			var sh = shapeArray[i];
		}
		var rgb = randomColourObject();
		ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		ctx.xcross(w/2, h/2, 200);
	}


	override function setup(){
		trace('setup: ${toString()}');

		var colorArray = lib.util.ColorUtil.niceColor100[randomInt(lib.util.ColorUtil.niceColor100.length-1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);

		isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// grid.setNumbered(3,3);
		grid.setCellSize(_cellsize);
		grid.setIsCenterPoint(true);

		shapeArray = [];
		for (i in 0...grid.array.length) {
			shapeArray.push(createShape(i, grid.array[i]));
		}
	}

	override function draw(){
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}