package art;

/**
 * short description what this does
 */
class CC058 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	// sizes
	var _radius = 150;
	var _cellsize = 150;
	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;
	var panel1:QuickSettings;
	var isFontLoaded:Bool = false;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// setup Sketch
		var option = new Sketch.SketchOption();
		option.width = 1080; // 1080
		// option.height = 1000;
		option.autostart = true;
		option.padding = 10;
		option.scale = true;
		ctx = Sketch.create("creative_code_mck", option);

		super(ctx);
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		ctx.fillPolygon(w2, h2, 6, w3);
		ctx.clip();
		var max = 50;
		for (i in 0...max) {
			var offset = 10;
			var startDegree = 180 / 6;
			ctx.save();
			ctx.translate(w2, h2);
			ctx.rotate(radians(startDegree + (i * 1)));
			ctx.strokeColourRGB(BLACK);
			ctx.strokePolygon(0, 0, 6, offset * i);
			ctx.restore();
		}
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
