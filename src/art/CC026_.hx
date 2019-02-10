package art;

/**
 * short description what this does
 */
class CC026 {

	var shapeArray : Array<Circle> = [];
	var grid : GridUtil = new GridUtil();

	var _radius = 150;
	var _cellsize = 150;
	var _bgColor:RGB = null;
	var _lineColor:RGB = null;
	var _fillColor:RGB = null;

	var ctx2: CanvasRenderingContext2D;
	var ctx: CanvasRenderingContext2D;

	public function new(ctx:CanvasRenderingContext2D) {

		trace('x');

			setup();
	}


	function setup(){
		trace('setup');
		var temp = document.getElementById('creative_code_mck');
		for (i in document.getElementsByClassName('container')){
			i.innerText = '';
		}

		// document.removeChild(temp);


		var option = new Sketch.SketchOption();
		option.width = 1025;
		option.height = 768;

		// ctx = Sketch.create('testme');


		ctx2 = Sketch.createHiddenCanvas('imageholder', option);


		GoJs.timer(1).onComplete(testFun);
		// ctx2.fillColourRGB(BLACK);
		// ctx2.fillCircle(0,0,100);

	}

	function testFun(){
		var img = new Image();
		img.src = '/assets/img/rhino.jpg';
		// img.crossOrigin = "Anonymous";
		img.onload = function() {

			// ctx.drawImage(img, 0,0);
			// ctx.fillColourRGB(BLACK);
			// ctx.fillCircle(0,0,100);
			// ctx.drawImage(img, 0, 0);

			ctx2.fillColourRGB(BLACK);
			ctx2.fillCircle(0,0,100);

			ctx2.drawImage(img, 0, 0);
			// img.style.display = 'none';
		};

	}


}