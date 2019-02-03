package art;

/**
 *
 */
class CC007 extends CCBase implements ICCBase {

	var maxDistance = 100;
	var maxBalls = 100;
	var sizeBall = 10;
	var ballArray : Array<AnimateObj> = [];
	var startTime : Float;
	var startDate : Float;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		// lib.util.HelperUtil.stats();
		// trace('wait 3 seconds');
		// haxe.Timer.delay(testTimer, 3000); // 1 milisecond delay
	}
	function testTimer(){
		startTime = haxe.Timer.stamp();
		startDate = Date.now().getTime();
		onCompleteHandler(null);
		lets.GoJs.timer(1).onComplete(onCompleteHandler,[1]);
		lets.GoJs.timer(2).onComplete(onCompleteHandler,[2]);
		lets.GoJs.timer(5).onComplete(onCompleteHandler,[5]);
		lets.GoJs.timer(1.5).onComplete(onCompleteHandler,[1.5]);
		lets.GoJs.timer(2).onComplete(onCompleteHandler,[2]);
		lets.GoJs.timer(4).onComplete(onCompleteHandler,[4]);
		lets.GoJs.timer(8).onComplete(onCompleteHandler,[8]);
	}
	function onCompleteHandler(value){
		var totalTime = (haxe.Timer.stamp()- startTime);
		var totalDate = (Date.now().getTime()- startDate)/1000;
		trace('done: $value seconds - date: $totalDate , time: $totalTime');
	}

	override function setup(){
		trace('setup: ${toString()}');
		// var rgb = randomColourObject();
		// ctx.strokeColour(rgb.r, rgb.g, rgb.b);
		// ctx.xcross(w/2, h/2, 200);
		ballArray = [];
		for (i in 0...maxBalls){
			var ball = createBall();
			ballArray.push( ball );
			ballAnimate(ball);
			// GoJs.to(ball, random(1,10)).x(random(0,w)).y(random(0,h)).onComplete(ballAnimate,[ball]);
		}
	}

	function ballAnimate(ball:AnimateObj){
		GoJs.to(ball, random(1,10)).x(random(0,w)).y(random(0,h)).onComplete(ballAnimate,[ball]).ease(Sine.easeInOut);
	}

	function createBall() : AnimateObj{
		var ball : AnimateObj = {
			x: random(sizeBall/2, w-(sizeBall/2)),
			y: random(sizeBall/2, h-(sizeBall/2)),
			size: random(sizeBall, sizeBall*4),
			color:randomColour(),
		}
		return ball;
	}


	function drawBall(){
		for ( i in 0 ... ballArray.length ) {
			var b1 = ballArray[i];
			ctx.fillStyle = b1.color;
			ctx.fillCircle(b1.x, b1.y, b1.size);
		}

	}

	override function draw(){
		// trace('draw: ${toString()}');
		// moveBall();
		ctx.clearRect(0, 0, w, h);
		ctx.background(WHITE.r,WHITE.g,WHITE.b);
		drawBall();
		// stop();
	}
}