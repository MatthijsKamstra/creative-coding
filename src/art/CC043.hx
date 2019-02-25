package art;

/**
 * short description what this does
 */
class CC043 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var _radius = 150;
	var _cellsize = 150;
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'First attempt at creating snake like patterns';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);
	}

	function createShape(i:Int, ?point:Point) {
		var shape:Circle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
			radius: _radius,
		}
		return shape;
	}


	function drawShape() {
		// ctx.clearRect(0, 0, w, h);

		ctx.strokeColourRGB(BLACK,0.1);
		ctx.strokeEllipse(w/2,h/2,random(10,100),random(10,100));



			// ctx.save();
			// ctx.translate(sh.x, sh.y);
			// ctx.rotate(radians(sh.rotation) );
			// ctx.centreFillRect(0, 0, sh.width, sh.height);
			// ctx.restore();

	}

	override function setup() {
		trace('setup: ${toString()}');

		ctx.backgroundObj(WHITE);
		var colorArray = lib.util.ColorUtil.niceColor100[randomInt(lib.util.ColorUtil.niceColor100.length - 1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);

		isDebug = true;
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
