package art;

import noisehx.Perlin;

/**
 * short description what this does
 */
class CC041 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	var _radius = 150;
	var _cellsize = 150;
	var _bgColor:RGB = null;
	var _lineColor:RGB = null;
	var _fillColor:RGB = null;
	var perlin:Perlin = new Perlin();

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Example of random created with Perlin Noise';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300i,700
		FontUtil.embedGoogleFont('Open+Sans+Condensed:300,300i,700', onEmbedHandler);

		super(ctx);
	}

	function onEmbedHandler(e) {
		trace('Embed: "${e}"');
		// FontUtil.centerFillText(ctx, toString(), w/2, h/2, "'UnifrakturMaguntia', cursive", 50);
		// FontUtil.centerFillText(ctx, description, Math.round(w/2), 20, "'Press Start 2P', cursive;", 8);
		drawShape();
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

	var xpos = 0;
	var ypos = 0;

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		ctx.fillStyle = getColourObj(BLACK);
		FontUtil.centerFillText(ctx, 'Math.random', grid.array[0].x, grid.array[0].y - (_radius * 1.5), "'Open Sans Condensed', sans-serif", 60);
		FontUtil.centerFillText(ctx, 'Perlin noise', grid.array[1].x, grid.array[1].y - (_radius * 1.5), "'Open Sans Condensed', sans-serif", 60);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			var _randomX = random(-1,1);
			var _randomY = random(-1,1);
			var _value = 50;
			if(i == 0){
				trace('first');

			} else {
				trace('second +');
				_randomX= (perlin.noise2d(xpos*1.1,ypos*1.1));
				_randomY= (perlin.noise2d(xpos*1.1,ypos*1.1));
				xpos++;
				ypos++;
			}
			var _xpos = sh.x + (_randomX * _value);
			var _ypos = sh.y + (_randomY * _value);
			ctx.circle(_xpos, _ypos, sh.radius);
		}

		/*
		var _width = 100;
		var _height = 100;

		var min = 100000.0;
		var max = 0.0;
		var min2 = 100000.0;
		var max2 = 0.0;

		for (x in 0..._width) {
			for (y in 0..._height) {
				// var value:Float = perlin.noise2d(x / 10.0, y / 10.0);
				var value:Float = Math.abs(perlin.noise2d(x / 50, y / 50));
				// Do stuff with it...
				value *= 256;
				// trace('x:$x, y:$y , value: $value');
				if (value <= min) min = value;
				if (value >= max) max = value;

				ctx.colour(Math.round(value), Math.round(value), Math.round(value));
				// ctx.fillRect(x, y, 1, 1);

				var value2 = (perlin.noise2d(x*1.1,y*1.1));
				if (value2 <= min2) min2 = value2;
				if (value2 >= max2) max2 = value2;
				// trace('x '+m_perlin.OctavePerlin(x, y, 0.1, 1, 0.9, 2));
				// trace('y '+m_perlin.OctavePerlin(x, y, 0.1, 5, 0.5, 0.25));
				//  var c = m_perlin.OctavePerlin(x / 8, y / 8, 0.1, 5, 0.5, 0.25);
			}
		}

		trace('min: $min');
		trace('max: $max');

		trace('min2: $min2');
		trace('max2: $max2');
		*/
	}

	override function setup() {
		trace('setup: ${toString()}');

		var colorArray = lib.util.ColorUtil.niceColor100[randomInt(lib.util.ColorUtil.niceColor100.length - 1)];
		_bgColor = hex2RGB(colorArray[0]);
		_lineColor = hex2RGB(colorArray[1]);
		_fillColor = hex2RGB(colorArray[2]);

		isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// grid.setNumbered(3,3);
		grid.setCellSize(w / 2, h);
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
