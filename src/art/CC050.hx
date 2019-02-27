package art;

/**
 * short description what this does
 */
class CC050 extends CCBase implements ICCBase {
	var text:String = 'It is impossible to make anything foolproof because fools are so ingenious.';
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;
	var panel1:QuickSettings;
	var isFontLoaded:Bool = false;
	var _fontSize:Int = 160;
	var _defaultFontSize:Int = 160;
	var _lineHeight:Int = 100;
	var _defaultLineHeight:Int = 100;
	var _padding:Int = 0;
	var _defaultPadding:Int = 0;
	var _paddingTop:Int = 0;
	var _defaultPaddingTop:Int = 0;
	var square:Int;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'A tool to create quick quotes for Instagram';
		type = [CCType.IMAGE];

		// <link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700" rel="stylesheet">
		FontUtil.embedGoogleFont('Oswald:200,300,400,500,600,700', onEmbedHandler);

		createQuickSettings();

		super(ctx);
	}

	function onEmbedHandler(e) {
		trace('onEmbedHandler: "${e}"');
		isFontLoaded = true;
		drawShape();
	}

	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Quote generator")
			.setGlobalChangeHandler(untyped drawShape)
			.addHTML("Reason", "Sometimes I need a quick quote, to post on Instagram")

			.addTextArea('Quote', text, function(value) trace(value))
			.addBoolean('All Caps', false, function(value) setCaps(value))
			.addRange('Font size', 10, 500, _defaultFontSize, 1, function(value) setFontSize(value))
			.addRange('Line height', 10, 500, _defaultLineHeight, 1, function(value) setLineHeight(value))
			.addRange('Padding left/right', 0, 500, _defaultPadding, 1, function(value) setPadding(value))
			.addRange('Padding top', -100, 500, _defaultPaddingTop, 1, function(value) setPaddingTop(value))

			.addButton('Random Color', function(value) randomColorize())

			.saveInLocalStorage('store-data-${toString()}');
	}

	function setCaps(isCaps:Bool) {
		if (isCaps) {
			text = text.toUpperCase();
		} else {
			text = text.toLowerCase();
		}
		// hmmmm remember previouse... with caps, etc
	}

	function setFontSize(value:Int) {
		_fontSize = value;
	}

	function setLineHeight(value:Int) {
		_lineHeight = value;
	}

	function setPadding(value:Int) {
		_padding = value;
	}

	function setPaddingTop(value:Int) {
		_paddingTop = value;
	}

	function randomColorize() {
		var colorArray = lib.util.ColorUtil.niceColor100SortedString[randomInt(lib.util.ColorUtil.niceColor100SortedString.length - 1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);
		_color3 = hex2RGB(colorArray[3]);
		_color4 = hex2RGB(colorArray[4]);
	}

	// source: https://en.wikiquote.org/wiki/Talk:Murphy%27s_law
	function drawShape() {
		if (!isFontLoaded)
			return;

		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(_color0);

		// important to have a example text in the canvas, otherwise the measurement don't work
		// important to have the font loaded
		ctx.fillStyle = getColourObj(_color4);
		FontUtil.fillText(ctx, text, w / 2, -h, "'Oswald', sans-serif;", _fontSize);

		// split text up into string/lines
		var lines:Array<String> = TextUtil.getLines(ctx, text, square - (2 * _padding));
		for (i in 0...lines.length) {
			var line = lines[i];
			FontUtil.fillText(ctx, line, _padding, _paddingTop + ((i + 1) * _lineHeight), "'Oswald', sans-serif;", _fontSize);
		}
	}

	override function setup() {
		trace('setup: ${toString()}');

		randomColorize();

		isDebug = true;

		// resize canvas to Square
		var canvas:js.html.CanvasElement = cast document.getElementById('creative_code_mck');
		square = Math.round(Math.min(w, h));

		trace('w: $w, h: $h');
		trace('square: $square');

		canvas.width = square - 2;
		canvas.height = square - 2;
		canvas.style.border = '1px solid silver';
	}

	override function draw() {
		trace('draw: ${toString()}');
		drawShape();
		stop();
	}
}
