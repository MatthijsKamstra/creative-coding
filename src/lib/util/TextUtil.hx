package lib.util;

import js.html.CanvasRenderingContext2D;

class TextUtil {
	public function new () {
		// your code
	}
	/**
	 *
	 * 		// important to have a example text in the canvas, otherwise the measurement don't work
		// important to have the font loaded

	 * @source	 https://stackoverflow.com/questions/2936112/text-wrap-in-a-canvas-element
	 *
	 * @param ctx
	 * @param text
	 * @param maxWidth
	 */
	public static function getLines(ctx:CanvasRenderingContext2D, text:String, maxWidth:Float) : Array<String> {
		// trace('$text, $maxWidth');
		var words : Array<String> = text.split(" ");
		var lines : Array<String> = [];
		var currentLine = words[0];

		for ( i in 1 ... words.length ) {
			// for (var i = 1; i < words.length; i++) {
			var word = words[i];
			var width = ctx.measureText(currentLine + " " + word).width;
			if (width < maxWidth) {
				currentLine += " " + word;
			} else {
				lines.push(currentLine);
				currentLine = word;
			}
		}
		lines.push(currentLine);
		return lines;
	}


// function drawTextAlongArc(context, str, centerX, centerY, radius, angle){
//                 context.save();
//                 context.translate(centerX, centerY);
//                 context.rotate(-1 * angle / 2);
//                 context.rotate(-1 * (angle / str.length) / 2);
//                 for (var n = 0; n < str.length; n++) {
//                     context.rotate(angle / str.length);
//                     context.save();
//                     context.translate(0, -1 * radius);
//                     var char = str[n];
//                     context.fillText(char, 0, 0);
//                     context.restore();
//                 }
//                 context.restore();
// }

// window.onload = function(){
//   var canvas = document.getElementById("myCanvas");
//   var context = canvas.getContext("2d");

//   context.font = "30pt Arial";
//   context.textAlign = "center";

//   var centerX = canvas.width / 2;
//   var centerY = canvas.height - 30;
//   var angle = Math.PI * 0.8; // radians
//   var radius = 180;
//   drawTextAlongArc(context, "Zak Ruvalcaba", centerX, centerY, radius, angle);
// };

}
