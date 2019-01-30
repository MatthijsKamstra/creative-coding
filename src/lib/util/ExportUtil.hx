package lib.util;

import js.Browser.*;
import js.html.*;

class ExportUtil {
	public function new() {}

	public static function downloadImage(ctx:CanvasRenderingContext2D, ?isJpg:Bool = false, ?fileName:String) {
		if (fileName == null)
			fileName = 'gen-art_${Date.now().getTime()}';
		var link = document.createAnchorElement();
		link.href = ctx.canvas.toDataURL((isJpg) ? 'image/jpeg' : '', 1);
		link.download = fileName;
		link.click();
	}

	public static function onBase64Handler(ctx:CanvasRenderingContext2D, ?isJpg:Bool = false) {
		var base64 = ctx.canvas.toDataURL((isJpg) ? 'image/jpeg' : '', 1);
		// var base64 = ctx.toDataURL(); // default png
		clipboard(base64);
	}

	// Returns contents of a canvas as a png based data url, with the specified
	// background color
	/*
		public static function canvasToImage(canvas:js.html.CanvasElement, ?backgroundColor:String) {
			// cache height and width
			var w = canvas.width;
			var h = canvas.height;

			var context = canvas.getContext2d();

			var data;
			var compositeOperation:String;

			if (backgroundColor != null) {
				// get the current ImageData for the canvas.
				data = context.getImageData(0, 0, w, h);

				// store the current globalCompositeOperation
				compositeOperation = context.globalCompositeOperation;

				// set to draw behind current content
				context.globalCompositeOperation = "destination-over";

				// set background color
				context.fillStyle = backgroundColor;

				// draw background / rect on entire canvas
				context.fillRect(0, 0, w, h);
			}

			// get the image data from the canvas
			var imageData = canvas.toDataURL("image/png");

			if (backgroundColor != null) {
				// clear the canvas
				context.clearRect(0, 0, w, h);

				// restore it with original / cached ImageData
				context.putImageData(data, 0, 0);

				// reset the globalCompositeOperation to what it was
				context.globalCompositeOperation = compositeOperation;
			}

			// return the Base64 encoded data url string
			return imageData;
		}
	 */

	/**
		* [Description]
				utils.Clipboard.copy('hello');
		* @param text
	 */
	public static function clipboard(text:String) {
		var win = 'Ctrl+C';
		var mac = 'Cmd+C';
		var copyCombo = win;
		var userAgent = js.Browser.navigator.userAgent;
		var ereg = new EReg("iPhone|iPod|iPad|Android|BlackBerry", "i");
		var ismac = ereg.match(userAgent);
		if (ismac)
			copyCombo = mac;
		window.prompt('Copy to clipboard: $copyCombo, Enter', text);
	}
}
