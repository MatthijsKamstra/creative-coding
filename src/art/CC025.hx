package art;

/**
 * short description what this does
 */
class CC025 extends CCBase implements ICCBase {

	var shapeArray : Array<Circle> = [];
	var grid : GridUtil = new GridUtil();

	var _radius = 150;
	var _cellsize = 150;
	var _bgColor:RGB = null;
	var _lineColor:RGB = null;
	var _fillColor:RGB = null;
	var _lineColor2:RGB = null;
	var _fillColor2:RGB = null;


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
		// Go.to(circle, 5).x(w/2).y(h/2).ease(Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	}

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(WHITE);


		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}


		for ( i in 0 ... grid.array.length ) {
			var point : Point = grid.array[i];
			var colorArray = ColorUtil.niceColor100[i];
			var color0 = hex2RGB(colorArray[0]);
			var color1 = hex2RGB(colorArray[1]);
			var color2 = hex2RGB(colorArray[2]);
			var color3 = hex2RGB(colorArray[3]);
			var color4 = hex2RGB(colorArray[4]);
			var _colorA = [color0, color1, color2, color3, color4];
			for ( j in 0 ... _colorA.length ) {
				var px = 10;

				var _w = Math.round((grid.cellWidth-px)/_colorA.length);
				var offsetX = j*_w;
				// ctx.strokeColourRGB(_colorA[j]);
				// ctx.strokeWeight(_w);
				ctx.fillColourRGB(_colorA[j]);
				ctx.fillRect(offsetX + point.x, point.y, _w , grid.cellHeight - px);
			}
		}
	}


	override function setup(){
		// trace('setup: ${toString()}');

		// var colorArray = ColorUtil.niceColor100[randomInt(ColorUtil.niceColor100.length-1)];
		var colorArray = ColorUtil.niceColor100[10];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[1]);
		_fillColor = hex2RGB(colorArray[2]);
		_lineColor2 = hex2RGB(colorArray[3]);
		_fillColor2 = hex2RGB(colorArray[4]);

		// isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		grid.setNumbered(10,10);
		// grid.setCellSize(_cellsize);
		// grid.setIsCenterPoint(true);

	}

	override function draw(){
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}