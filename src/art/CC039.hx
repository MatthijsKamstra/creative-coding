package art;

import quicksettings.QuickSettings;

using lib.util.FilterUtil;

/**
 * short description what this does
 */
class CC039 extends CCBase implements ICCBase {

	var ctxHidden:CanvasRenderingContext2D;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Image manipulation';

		createQuickSettings ();

		super(ctx);
	}


	/**
	 *
	 * https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/filter#Browser_compatibility
	 */

	function createQuickSettings (){
		// demo/basic example
		var panel1 = QuickSettings.create(10, 10, "Filters")
			.addRange("Grayscale", 0, 100, 0, 1, function(value) setFilter("grayscale", value))
			.addRange("Range", 0, 100, 30, 1, function(value) output("Range", value))
			.addNumber("Number", 0, 100, 50, 1, function(value) output("Number", value))
			.addColor("Color", "#ff0000", function(value) output("Color", value))
			.addBoolean("Boolean", true, function(value) output("Boolean", value))
			.addText("Text", "some text", function(value) output("Text", value))
			.addTextArea("TextArea", "a whole bunch of text can go here", function(value) output("TextArea", value))
			.addButton("Button", function(value) output("Button", "clicked"))
			.addHTML("Info", "Info. This is a description...")
			.setKey("s")
			.saveInLocalStorage("localstoragedemo_v3.0");
	}

	inline function output<T>(name:String, value:T) {
		console.log("Output", '$name: $value');
	}

	function setFilter(type:String, value:Float){
		if(ctx == null) return;
		switch (type.toLowerCase()) {
			case 'grayscale': {
				trace ('grayscale');
				ctx.grayscale(value);
				drawShape();
			}
			default : trace ("case '"+type+"': trace ('"+type+"');");
		}
	}


	function drawShape(){
		if(ctxHidden == null) return;

		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(WHITE);

		// ctx.filter = 'blur(4px)';
		// ctx.grayscale(50);
		ctx.drawImage(ctxHidden.canvas,0,0);

	}


	override function setup(){
		trace('setup: ${toString()}');

		isDebug = true;

		// start loading image
		var img = new Image();
		img.src = 'assets/img/lotus.jpg';
		img.onload = function() {
			var option = new Sketch.SketchOption();
			option.width = img.width;
			option.height = img.height;
			ctxHidden = Sketch.createHiddenCanvas('imageholder', option, isDebug);
			ctxHidden.drawImage(img, 0, 0, img.width, img.height);
			img.style.display = 'none';
			drawShape();
		};
	}

	override function draw(){
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}