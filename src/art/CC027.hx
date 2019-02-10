package art;

/**
 * short description what this does
 */
class CC027 extends CCBase implements ICCBase {

	var shapeArray:Array<Circle> = [];
	var shapeMax = 5000;
	var ctxHidden:CanvasRenderingContext2D;
	var readyCounter = 0;
	var grid:GridUtil = new GridUtil();
	var _cellsize = 10;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
		lib.util.HelperUtil.stats();
	}

	// ____________________________________ handlers ____________________________________

	function onAnimateHandler(circle:Circle) {
		var startx = circle.x;
		var starty = circle.y;

		if (posNeg() > 0) {
			startx = (circle.x < w / 2) ? circle.x - w : circle.x + w;
			starty += random(-h, h);
		} else {
			startx += random(-w, w);
			starty = (circle.y < h / 2) ? circle.y - h : circle.y + h;
		}

		var time = random(1, 3);
		var delay = random(0, 3) + 2; // wait for 2 seconds

		GoJs.from(circle, time)
			.delay(delay)
			.x(startx)
			.y(starty)
			.ease(lets.easing.Quart.easeOut)
			.onComplete(onCompleteHandler, [circle]);
	}

	function onCompleteHandler(circle) {
		readyCounter++;
		if (readyCounter >= shapeArray.length) {
			trace('stop');
			stop();
		}
	}

	// ____________________________________ shape related  ____________________________________

	function drawShape() {
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		// if (isDebug) {
		// 	ShapeUtil.gridDots(ctx, grid);
		// }

		for (i in 0...shapeArray.length) {
			var circle = shapeArray[i];

			// ctx.fillStyle = circle.colour;
			// ctx.fillStyle = getColourObj(BLACK);
			// ctx.circle(circle.x, circle.y, circle.radius);
			// ctx.strokeColourRGB (circle.rgb);
			ctx.strokeCircle(circle.x, circle.y, circle.radius);
		}
	}

	function getPixel() {

		grid.setPosition(0,0);
		grid.setCellSize(_cellsize);
		grid.setDimension(ctxHidden.canvas.width, ctxHidden.canvas.height);
		trace('canvas (width,height): ${ctxHidden.canvas.width},${ctxHidden.canvas.height}');
		trace('grid (width,height): ${grid.width},${grid.height}');
		trace('grid.array.length: ${grid.array.length}');
		trace('grid cell (width,height): ${grid.cellHeight}, ${grid.cellWidth}');



		for (i in 0...grid.array.length) {
			var point = grid.array[i];
			var xpos = Math.round(point.x);
			var ypos = Math.round(point.y);

			var pixel = ctxHidden.getImageData(xpos, ypos, 1, 1);
			var data = pixel.data;
			if (data[0] == 255 && data[1] == 255 && data[2] == 255)
				continue;
			if (data[0] != 0 && data[1] != 0 && data[2] != 0)
				continue;
			var rgba = 'rgba(' + data[0] + ', ' + data[1] + ', ' + data[2] + ', ' + (data[3] / 255) + ')';
			// trace(rgba);

			var xstart = Math.round((w - ctxHidden.canvas.width) / 2);
			var ystart = Math.round((h - ctxHidden.canvas.height) / 2);

			var circle:Circle = {
				_id: '$i',
				_type: 'circle',
				x: xstart + xpos,
				y: ystart + ypos,
				radius: _cellsize/2,
				colour: rgba,
			}
			shapeArray.push(circle);
		}

		// console.table(shapeArray);
		trace('total shape: ${shapeArray.length} from total grid ${grid.array.length}');
		for (i in 0...shapeArray.length) {
			var _shapeArray = shapeArray[i];
			onAnimateHandler(_shapeArray);
		}
	}


	// ____________________________________ override  ____________________________________

	override function setup() {
		trace('setup: ${toString()}');

		shapeArray = [];
		// isDebug = true;

		// start loading image
		var img = new Image();
		img.src = '/assets/img/planb.png';
		img.onload = function() {
			var option = new Sketch.SketchOption();
			option.width = img.width;
			option.height = img.height;
			ctxHidden = Sketch.createHiddenCanvas('imageholder', option);
			ctxHidden.drawImage(img, 0, 0, img.width, img.height);
			img.style.display = 'none';

			getPixel();
		};
	}

	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}

	// ____________________________________ helpers ____________________________________
	function pixelData2RGBA(data:Uint8ClampedArray):RGBA {
		return {
			r: data[0],
			g: data[1],
			b: data[2],
			a: (data[3] / 255),
		}
	}

	function pixelData2RGB(data:Uint8ClampedArray):RGB {
		return {
			r: data[0],
			g: data[1],
			b: data[2],
		}
	}
}
