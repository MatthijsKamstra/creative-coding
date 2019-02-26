package art;

import noise.Perlin;

import quicksettings.QuickSettings;

using lib.util.FilterUtil;

/**
 * short description what this does
 */
class CC044 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var _radius = 150;
	var _cellsize = 150;
	var _bgColor:RGB = null;
	var _lineColor:RGB = null;
	var _fillColor:RGB = null;


	var perlin:Perlin = new Perlin();

	var xValue:Float = 50;
	var yValue:Float = 50;
	var octaves:Int = 1;
	var amplitude:Float = 1;
	var persistence:Float = 0.9;
	var lacunarity:Float = 2;

	var _width = w;
	var _height = h;

	var defaultW = 300;
	var defaultH = 300;

	var ctxHidden:CanvasRenderingContext2D;
	var panel1:QuickSettings;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Test with Perlin Noise, see what happens with different settings';
		type = [CCType.IMAGE];

		createQuickSettings();

		super(ctx);
	}

/**
	 *
	 * https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/filter#Browser_compatibility
	 */
	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Perlin Noise")
			.setGlobalChangeHandler(untyped drawShape)

			.addHTML("About", "I had problems wrapping my head around the patterns created with Perlin Noise. It feels kinda magical and I don't seem to get the images I expect")

			.addRange("perlin", 0, 65536, 50, 1, function(value) perlin = new Perlin (value) )

			.addRange("xValue", 0.0, 100.0, 50.0, 1.0, function(value) xValue = value )
			.addRange("yValue",  0.0, 100.0, 50.0, 1.0, function(value) yValue = value )

			.addRange("octaves", 0, 10, 1, 1, function(value) octaves = value )

			.addRange("amplitude", 0.0, 10.0, 1.0, 0.1, function(value) amplitude = value )
			.addRange("persistence", 0.0, 10.0, 0.9, 0.1, function(value) persistence = value )
			.addRange("lacunarity", 0.0, 10.0, 2.0, .1, function(value) lacunarity = value )


			.addBoolean("Fullscreen", false, function(value) isFullscreen(value))

			.addButton("defaults",function (value) quicksetttingsDefault() )

			.saveInLocalStorage("localstoragedemo_v3.0");
	}

	inline function output<T>(name:String, value:T) {
		console.log("Output", '$name: $value');
	}

	function quicksetttingsDefault(){
		trace('defaults');
		panel1.setValue('Fullscreen', false);
		panel1.setValue('octaves', 1);



		panel1.setValue('xValue', 50.0);
		panel1.setValue('yValue',50.0);
		panel1.setValue('amplitude',1.0);
		panel1.setValue('persistence',0.9);
		panel1.setValue('lacunarity', 2.0);

	}

	function isFullscreen(isfullscreen:Bool){
		if(isfullscreen){
			_width = w;
			_height = h;
		} else {
			_width = defaultW;
			_height = defaultH;
		}
	}

	function drawShape():Void {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		var min = 100000.0;
		var max = 0.0;

		var xOffset = 0.0;
		var yOffset = 0.0;

		if(_width == defaultW) xOffset = (w-defaultW)/2;
		if(_height == defaultH) yOffset = (h-defaultH)/2;

		for (x in 0..._width) {
			for (y in 0..._height) {
				// var value:Float = perlin.noise2d(x / 10.0, y / 10.0);
				var value:Float = Math.abs(perlin.noise2d(x / xValue, y / yValue, octaves, amplitude, persistence, lacunarity));
				// Do stuff with it...
				value *= 256;
				// trace('x:$x, y:$y , value: $value');
				if (value <= min)
					min = value;
				if (value >= max)
					max = value;
				ctx.colour(Math.round(value), Math.round(value), Math.round(value));
				ctx.fillRect(xOffset + x, yOffset + y, 1, 1);
			}
		}

		trace('min: $min');
		trace('max: $max');

		console.group('Perlin Noise values');
		console.log('xValue: $xValue');
		console.log('yValue: $yValue');
		console.log('octaves: $octaves');
		console.log('amplitude: $amplitude');
		console.log('persistence: $persistence');
		console.log('lacunarity: $lacunarity');
		console.groupEnd();
	}

	override function setup() {
		trace('setup: ${toString()}');

		var colorArray = lib.util.ColorUtil.niceColor100[randomInt(lib.util.ColorUtil.niceColor100.length - 1)];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[1]);
		_fillColor = hex2RGB(colorArray[2]);

		isDebug = true;
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
