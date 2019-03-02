package art;

/**
 * short description what this does
 */
class CC040 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var _cellsize = 150;
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Quarter growing circle through dashed lines';
		type = [CCType.ANIMATION, CCType.IMAGE];
		super(ctx);
	}

	function createShape(i:Int, point:Point) {
		var shape:Circle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
			radius: _cellsize / 2,
		}
		Reflect.setField(shape, 'part', 0);
		Reflect.setField(shape, 'dir', 1);
		return shape;
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(BLACK);

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];

			ctx.strokeStyle = getColourObj(WHITE);
			ctx.lineCap = 'butt'; // "butt|round|square";
			ctx.lineWidth = 15;

			// get circumference from circles
			var omtrek:Float = MathUtil.circumferenceCircle(sh.radius);
			var part:Float = Reflect.getProperty(sh, 'part');
			var dir = Reflect.getProperty(sh, 'dir');

			// trace(Reflect.getProperty(sh, 'part'));
			// [mck] I have no idea why I need to sutrace `-0.5` but it fixes my little line problem
			ctx.setLineDash([part, (omtrek / 4)-0.5 -part]);
			ctx.strokeCircle(sh.x, sh.y, sh.radius);

			if (part >= omtrek / 4) {
				Reflect.setField(sh, 'dir', -1);
			}
			if (part < 0) {
				Reflect.setField(sh, 'dir', 1);
			}

			Reflect.setField(sh, 'part', part + dir);
		}
	}

	override function setup() {
		trace('setup: ${toString()}');

		var colorArray = ColorUtil.niceColor100[randomInt(ColorUtil.niceColor100.length - 1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);
		_color3 = hex2RGB(colorArray[3]);
		_color4 = hex2RGB(colorArray[4]);

		// isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// // grid.setNumbered(3,3);
		grid.setDebug(isDebug);
		grid.setCellSize(_cellsize);
		grid.setIsCenterPoint(true);

		shapeArray = [];
		for (i in 0...grid.array.length) {
			shapeArray.push(createShape(i, grid.array[i]));
		}
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
