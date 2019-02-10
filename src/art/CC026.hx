package art;

/**
 * short description what this does
 */
class CC026 extends CCBase implements ICCBase {

	var shapeArray : Array<Circle> = [];
	var grid : GridUtil = new GridUtil();

	var shapeMax = 2000;

	var _radius = 150;
	var _cellsize = 150;
	var _bgColor:RGB = null;
	var _lineColor:RGB = null;
	var _fillColor:RGB = null;

	var ctx2: CanvasRenderingContext2D;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	// function createShape(i:Int, ?point:Point){
	// 	var shape : Circle = {
	// 		_id: '$i',
	// 		_type: 'circle',
	// 		x: point.x,
	// 		y: point.y,
	// 		radius:_radius,
	// 	}
	// 	// onAnimateHandler(shape);
	// 	return shape;
	// }

	function onAnimateHandler(circle:Circle){
		var startx = circle.x;
		var starty = circle.y;

		if(posNeg() > 0 ){
			startx = (circle.x < w/2) ? circle.x - w: circle.x + w;
			starty += random(-h,h);
		} else{
			startx += random(-w,w);
			starty = (circle.y < h/2) ? circle.y - h: circle.y + h;
		}

		var time = random(1,3);
		var delay = random(0,3);

		GoJs.from(circle, time).delay(delay).x(startx).y(starty).ease(lets.easing.Sine.easeOut);
	}

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(WHITE);


		for ( i in 0 ... shapeArray.length ) {
			var circle = shapeArray[i];

			ctx.fillStyle = circle.colour;
			ctx.circle(circle.x, circle.y, 5);

		}

	}


	override function setup(){
		trace('setup: ${toString()}');
		var img = new Image();
		// img.src = '/assets/img/rhino.jpg';
		// img.src = '/assets/img/planb.jpg';
		img.src = '/assets/img/planb.png';
		img.onload = function() {
			// trace(img.width, img.height);
			// trace(img.src);

			var option = new Sketch.SketchOption();
			option.width = img.width;
			option.height = img.height;
			ctx2 = Sketch.createHiddenCanvas('imageholder', option);
			ctx2.drawImage(img, 0, 0, img.width, img.height);
			img.style.display = 'none';

			getPixel();
		};

	}

	function getPixel(){
		for (i in 0...shapeMax){
			var xpos = random(0,ctx2.canvas.width);
			var ypos = random(0,ctx2.canvas.height);

			var pixel = ctx2.getImageData(xpos, ypos, 1, 1);
			var data = pixel.data;
			if(data[0] == 255 && data[1] == 255 && data[2] == 255) continue;
			var rgba = 'rgba(' + data[0] + ', ' + data[1] +
						', ' + data[2] + ', ' + (data[3] / 255) + ')';
			// trace(rgba);

			var xstart = Math.round((w - ctx2.canvas.width)/2);
			var ystart = Math.round((h- ctx2.canvas.height)/2);

			var circle : Circle = {
				_id: '$i',
				_type: 'circle',
				x: xstart + xpos,
				y: ystart + ypos,
				radius:10,
				colour:rgba,
			}

			shapeArray.push(circle);
			// ctx.strokeCircle(circle.x, circle.y, 10);

		}

		// console.table(shapeArray);
		trace(shapeArray.length);
		for (i in 0...shapeArray.length){
			var _shapeArray = shapeArray[i];
			onAnimateHandler(_shapeArray);
		}
	}

	override function draw(){
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}