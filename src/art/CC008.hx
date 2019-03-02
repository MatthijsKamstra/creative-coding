package art;

/**
 * short description what this does
 */
class CC008 extends CCBase implements ICCBase {

	var shapeMax = 10;
	var shapeSize = 15;
	var shapeArray : Array<AnimateObj> = [];
	var startTime : Float;
	var startDate : Float;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = 'lets.Go tests with rotation, delay, easing';
		HelperUtil.stats();
	}

	function createShape(y) : AnimateObj{
		var shape : AnimateObj = {
			x: 100,
			y: (shapeSize*5)+(shapeSize*5*y),
			width: Math.round(random(shapeSize, shapeSize*4)),
			height: Math.round(random(shapeSize, shapeSize*4)),
			rotation: 0,
			color:randomColour(),
		}
		return shape;
	}

	function drawShape(){
		for ( i in 0 ... shapeArray.length ) {
			var sh = shapeArray[i];
			ctx.fillStyle = sh.color;
			// if(sh.rotation != 0){
				// ctx.save();
				// ctx.translate(sh.x, sh.y);
				// ctx.rotate(radians(sh.rotation) );
				// ctx.centreFillRect(0, 0, sh.width, sh.height);
				// ctx.restore();
			// } else {
			// 	ctx.centreFillRect(sh.x, sh.y, sh.width, sh.height);
			// }


			ctx.save();
			ctx.translate(sh.x, sh.y);
			ctx.rotate(radians(sh.rotation) );
			ctx.centreFillRect(0, 0, sh.width, sh.height);
			ctx.restore();
		}
	}


	override function setup(){
		trace('setup: ${toString()}');
		shapeArray = [];
		for (i in 0...shapeMax){
			var sh = createShape(i);
			shapeArray.push( sh );
		}
		var _shape = shapeArray[0];
		Go.to(_shape, 2).x(_shape.x + (w - _shape.x*2));
		var _shape = shapeArray[1];
		Go.to(_shape, 2).x(_shape.x + (w - _shape.x*2)).yoyo();
		var _shape = shapeArray[2];
		Go.from(_shape, 2).x(_shape.x + (w - _shape.x*2)).yoyo();
		var _shape = shapeArray[3];
		Go.to(_shape, 2).x(_shape.x + (w - _shape.x*2)).y(_shape.y+100).yoyo();
		var _shape = shapeArray[4];
		Go.to(_shape, 2).x(_shape.x + (w - _shape.x*2)).rotation(180).yoyo().onUpdate(onUpdateHandler, [4]);
		var _shape = shapeArray[5];
		Go.to(_shape, 2).x(_shape.x + (w - _shape.x*2)).prop('foobar',180).onUpdate(onUpdateHandler, [5]).onComplete(onCompleteHandler, [5]);
		var _shape = shapeArray[6];
		Go.to(_shape, 2).x(_shape.x + (w - _shape.x*2)).delay(.7).rotation(360).yoyo();
		var _shape = shapeArray[7];
		Go.to(_shape, 2).x(_shape.x + (w - _shape.x*2)).rotation(360).yoyo().ease(Sine.easeInOut);
	}

	function onUpdateHandler (value) : Void {
		var _shape = shapeArray[value];

		switch (value) {
			case 4: trace('onUpdateHandler - rotation: '+ untyped _shape.rotation);
			case 5: trace('onUpdateHandler - foobar: '+ untyped _shape.foobar);
			default : trace ("case "+value+": trace ('"+value+"');");
		}

	}
	function onCompleteHandler (value) : Void {
		var _shape = shapeArray[value];
		switch (value) {
			case 4: trace('onCompleteHandler - rotation: '+ untyped _shape.rotation);
			case 5: trace('onCompleteHandler - foobar: '+ untyped _shape.foobar);
			default : trace ("case "+value+": trace ('"+value+"');");
		}
	}


	override function draw(){
		// trace('draw: ${toString()}');
		ctx.clearRect(0, 0, w, h);
		ctx.background(WHITE.r,WHITE.g,WHITE.b);
		drawShape();

	}
}