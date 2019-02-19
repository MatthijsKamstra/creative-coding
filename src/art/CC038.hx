package art;

/**
 * short description what this does
 */
class CC038 extends CCBase implements ICCBase {
	var shapeArray:Array<Polygon> = [];
	var grid:GridUtil = new GridUtil();
	// var shapeMax = 100;
	var cellsize = 20;
	var maxSides = 6;
	var ctxHidden:CanvasRenderingContext2D;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function createShape(i:Int) {
		var shape:Polygon = {
			_id: '$i',
			_type: 'polygon',
			x: 0,
			y: 0,
			sides: maxSides,
			size: cellsize
		}
		return shape;
	}

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		// https://nl.wikipedia.org/wiki/Sinusregel
		var hoek = 360 / maxSides;
		var hoek_2 = radians(hoek / 2);
		var horDistSin = Math.sin(hoek_2) * cellsize;
		var horDistCos = Math.cos(hoek_2) * cellsize;
		var horDistTan = Math.tan(hoek_2) * cellsize;

		trace('schuine zijde: $cellsize');
		trace('- horDistSin: $horDistSin');
		trace('> horDistCos: $horDistCos');
		trace('- horDistTan: $horDistTan');

		trace((lib.util.MathUtil.pythagoreanTheorem(0, horDistCos, cellsize)));

		// var distX = cellsize + (lib.util.MathUtil.pythagoreanTheorem(0,horDistCos,cellsize));
		var distX = cellsize + horDistSin;
		var distY = horDistCos;

		grid.setIsFullscreen();
		// grid.setDimension(w*2, h*2);
		// grid.setPosition(0, 0);
		grid.setCellSize(distX, distY);
		grid.setIsCenterPoint(true);

		for (i in 0...grid.array.length) {
			shapeArray.push(createShape(i));
		}

		trace('w: ${w}, h: ${h}');
		trace('total: ${grid.array.length}');
		trace('numHor: ${grid.numHor}, numVer: ${grid.numVer}');
		trace('width: ${grid.width}, height: ${grid.height}');
		trace('x: ${grid.x}, y: ${grid.y}');

		var startX:Float = grid.x;
		var startY:Float = grid.y;

		var gridCounterY = 0;
		var gridCounterX = 0;

		for (i in 0...shapeArray.length) {
			var sh = shapeArray[i];
			sh.x = startX + (gridCounterX * (distX));
			sh.y = startY + (gridCounterY * (distY * 2));
			ctx.strokeColourRGB(BLACK);
			ctx.fillColourRGB(randomColourObject());
			// ctx.strokePolygon(sh.x, sh.y, sh.sides, sh.size);
			var __color = getPixel(sh.x, sh.y);
			ctx.outlinedPolygon(sh.x, sh.y, sh.sides, sh.size, __color, getColourObj(BLACK));
			gridCounterY++;
			if (gridCounterY >= grid.numVer) {
				gridCounterX++;
				gridCounterY = 0;
				startX = grid.x;
				if ((gridCounterX % 2) == 1) {
					startY = grid.y + distY;
				} else {
					startY = grid.y;
				}
			}
		}

		if (isDebug) {
			// ShapeUtil.gridDots(ctx, grid);
			ShapeUtil.gridField(ctx, grid);
		}
	}

	function getPixel(x, y):String{
		var xpos = x;
		var ypos = y;
		var pixel = ctxHidden.getImageData(xpos, ypos, 1, 1);
		var data = pixel.data;
		var rgba = 'rgba(' + data[0] + ', ' + data[1] + ', ' + data[2] + ', ' + (data[3] / 255) + ')';
		return rgba;
	}


	override function setup() {
		trace('setup: ${toString()}');

		// isDebug = true;

		var colorArray = lib.util.ColorUtil.niceColor100SortedString[randomInt(lib.util.ColorUtil.niceColor100SortedString.length - 1)];
		var _color0 = hex2RGB(colorArray[0]);
		var _color1 = hex2RGB(colorArray[1]);
		var _color2 = hex2RGB(colorArray[2]);
		var _color3 = hex2RGB(colorArray[3]);
		var _color4 = hex2RGB(colorArray[4]);

		var option = new Sketch.SketchOption();
		option.width = w;
		option.height = h;
		ctxHidden = Sketch.createHiddenCanvas('imageholder', option, isDebug);
		// ctxHidden.drawImage(img, 0, 0, img.width, img.height);

		// create gradient
		var gradient = ctx.createLinearGradient(0, 0, w, h);
		// Add three color stops
		gradient.addColorStop(0, getColourObj(_color0));
		gradient.addColorStop(1, getColourObj(_color4));

		// Set the fill style and draw a rectangle (on "hidden" canvas)
		ctxHidden.fillStyle = gradient;
		ctxHidden.fillRect(0, 0, w, h);
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
