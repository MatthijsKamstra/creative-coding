package art;

/**
 * short description what this does
 */
class CC015 extends CCBase implements ICCBase {
	var shapeArray:Array<Point> = [];

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = 'clock';
	}

	var color = lib.util.ColorUtil.niceColor100[0];

	override function setup() {
		// isDebug = true;
	}

	function drawShape() {
		// trace(color);

		// trace('drawShape');
		var time = Date.now();
		var hours = time.getHours(); // 24
		var min = time.getMinutes(); // 60
		var sec = time.getSeconds(); // 60
		// var sec = time.get() + 1; // 60

		var min90 = -radians(90);
		var lineW = 100;
		var minRadius = 3 * lineW;
		var _lineCap = 'round'; // 'round' "butt|round|square";
		var centerX = w/2;
		var centerY = h/2;
		var _alpha = 0.1;

		if (isDebug){
			trace('$hours:$min:$sec');
			// hours = 23;
		}
		// 360graden == (2*Math.PI) == 24 uur == 60 min

		// sec
		ctx.beginPath();
		ctx.strokeStyle = getColourObj(hex2RGB(color[0]));
		ctx.lineCap = _lineCap;
		ctx.lineWidth = lineW;
		ctx.arc(centerX, centerY, minRadius - (0 * lineW), min90, radians((360 / 60) * sec) + min90);
		ctx.stroke();
		ctx.strokeStyle = getColourObj(hex2RGB(color[0]), _alpha);
		ctx.strokeCircle(centerX, centerY, minRadius - (0 * lineW));

		// min
		ctx.beginPath();
		ctx.strokeStyle = getColourObj(hex2RGB(color[1]));
		ctx.lineCap = _lineCap;
		ctx.lineWidth = lineW;
		ctx.arc(centerX, centerY, minRadius - (1 * lineW), min90, radians((360 / 60) * min) + min90);
		ctx.stroke();
		ctx.strokeStyle = getColourObj(hex2RGB(color[1]), _alpha);
		ctx.strokeCircle(centerX, centerY, minRadius - (1 * lineW));

		// hour
		ctx.beginPath();
		ctx.strokeStyle = getColourObj(hex2RGB(color[2]));
		ctx.lineCap = _lineCap;
		ctx.lineWidth = lineW;
		ctx.arc(centerX, centerY, minRadius - (2 * lineW), min90, radians((360 / 24) * hours) + min90);
		ctx.stroke();
		ctx.strokeStyle = getColourObj(hex2RGB(color[2]), _alpha);
		ctx.strokeCircle(centerX, centerY, minRadius - (2 * lineW));

	}

	override function draw() {
		// trace('draw: ${toString()}');
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);
		drawShape();
		// stop();
	}
}
