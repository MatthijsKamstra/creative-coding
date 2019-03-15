package art;

using StringTools;

/**
 * short description what this does
 */
class CC046 extends CCBase implements ICCBase {

	var counter = 0;
	var maxFrameRate = 60;
	var frameRate = 15;

	public function new(ctx:CanvasRenderingContext2D) {
		description = '';
		type = [CCType.ANIMATION, CCType.IMAGE];

		// <link href="https://fonts.googleapis.com/css?family=Share+Tech+Mono" rel="stylesheet">
		Text.embedGoogleFont('Share+Tech+Mono', onEmbedHandler);

		super(ctx);
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		drawShape();
	}



	function drawShape(){
		counter++;
		if (counter % (maxFrameRate / frameRate) != 0) {
			return;
		}



		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);


		var time = Date.now();
		var hours = time.getHours(); // 24
		var min = time.getMinutes(); // 60
		var sec = time.getSeconds(); // 60
		// var sec = time.get() + 1; // 60

		var text = '${Std.string(hours).lpad('0',2)}:${Std.string(min).lpad('0',2)}:${Std.string(sec).lpad('0',2)}';

		ctx.fillStyle = getColourObj(BLACK);
		Text.centerFillText(ctx, text, w/2, h/2, "'Share Tech Mono', monospace", 160);



	}


	override function setup(){
		trace('setup: ${toString()}');
		isDebug = true;
	}

	override function draw(){
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}