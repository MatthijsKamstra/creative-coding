package art;

/**
 * short description what this does
 */
class CC040 extends CCBase implements ICCBase {

	var shapeArray : Array<Circle> = [];
	var grid : GridUtil = new GridUtil();

	var max = 1;

	var startRadius = 200;


	var _radius = 150;
	var _cellsize = 150;
	var _color0 :RGB = null;
	var _color1 :RGB = null;
	var _color2 :RGB = null;
	var _color3 :RGB = null;
	var _color4 :RGB = null;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'circle lines';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);
	}

	function createShape(i:Int){
		var shape : Circle = {
			_id: '$i',
			_type: 'circle',
			x: w/2,
			y: h/2,
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
		ctx.backgroundObj(BLACK);

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			// sh.rotation = radians(randomInt(360));
			// sh.rotation += sh.speed;

			ctx.strokeStyle = getColourObj(WHITE);
			ctx.lineCap = 'butt'; // "butt|round|square";
			ctx.lineWidth =20;

			var radius = startRadius;
			var omtrek = (MathUtil.circumferenceCircle(radius));
			ctx.setLineDash([1,Math.round(omtrek/4)]);
			ctx.strokeCircle(sh.x, sh.y, radius);
		}
	}


	override function setup(){
		trace('setup: ${toString()}');

		var colorArray = lib.util.ColorUtil.niceColor100[randomInt(lib.util.ColorUtil.niceColor100.length-1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);
		_color3 = hex2RGB(colorArray[3]);
		_color4 = hex2RGB(colorArray[4]);


		isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// // grid.setNumbered(3,3);
		// grid.setCellSize(_cellsize);
		// grid.setIsCenterPoint(true);

		shapeArray = [];
		for (i in 0...max) {
			shapeArray.push(createShape(i));
		}

	}

	override function draw(){
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}