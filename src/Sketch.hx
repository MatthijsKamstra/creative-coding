package;

import js.Browser.*;
import js.Browser;
import js.html.*;
import js.html.MouseEvent;
import js.html.Event;
import js.html.CanvasElement;
import Global.*;

/**
 * inspired by George Gally, which was inpired by Seb Lee
 * https://github.com/GeorgeGally/creative_coding/blob/master/js/canvas.js
 *
 * The name is again inspired by ...
 */
class Sketch {
	public var window = js.Browser.window;
	public var document = js.Browser.document;
	public var canvas:js.html.CanvasElement;

	public function new() {}

	public static function create(name:String, ?type:String = '2d'):CanvasRenderingContext2D {
		new Sketch().init();
		if (type == '2d') {
			return new Sketch().createCanvas(name);
		} else {
			return new Sketch().createGLCanvas(name);
		}
	}

	// this enables me to have many canvases all positioned on top of eachother at 100% width and height of page
	public function createCanvas(canvas_name):CanvasRenderingContext2D {
		canvas = document.createCanvasElement();
		var body = document.querySelector('body');
		canvas.setAttribute("id", canvas_name);
		canvas.style.position = "absolute";
		canvas.style.left = "0px";
		canvas.style.top = "0px";
		body.appendChild(canvas);
		var ctx:CanvasRenderingContext2D = canvas.getContext('2d');
		resize();
		window.addEventListener(RESIZE, resize, false);
		return ctx;
	}

	public function createGLCanvas(canvas_name):CanvasRenderingContext2D {
		canvas = document.createCanvasElement();
		var body = document.querySelector('body');
		canvas.setAttribute("id", canvas_name);
		canvas.style.position = "absolute";
		canvas.style.left = "0px";
		canvas.style.top = "0px";
		body.appendChild(canvas);
		var gl:CanvasRenderingContext2D = canvas.getContext('webgl');
		if (gl == null)
			var gl = canvas.getContext('experimental-webgl');
		resize();
		window.addEventListener(RESIZE, resize, false);
		return gl;
	}

	function resize() {
		var c:Array<CanvasElement> = cast document.getElementsByTagName('canvas');
		w = window.innerWidth;
		h = window.innerHeight;
		for (i in 0...c.length) {
			var _c = c[i];
			_c.width = w;
			_c.height = h;
		}
		console.log("resize: " + w + ":" + h);
	}

	function createHiddenCanvas(canvas_name) {
		var ctx = createCanvas(canvas_name);
		canvas.style.left = -w + "px";
		return ctx;
	}

	public function init() {
		// trace('init');

		window.addEventListener(MOUSE_MOVE, function(e:MouseEvent) {
			mouseX = e.clientX;
			mouseY = e.clientY;
			mouseMoved = true;
			// trace(mouseX, mouseY);
		});

		window.addEventListener(MOUSE_DOWN, function(e) {
			mouseDown = true;
			// trace('${mouseDown}');
			// if(typeof onMouseDown == 'function') onMouseDown();
		});

		window.addEventListener(MOUSE_UP, function(e) {
			mouseDown = false;
			// trace('${mouseDown}');
			// if(typeof onMouseUp == 'function') onMouseUp();
		});

		window.addEventListener(KEY_DOWN, function (e:js.html.KeyboardEvent){
			if (e.metaKey == true && e.key == 'f'){
				if(!isFullscreen){
					openFullscreen();
					isFullscreen = true;
				} else {
					closeFullscreen();
					isFullscreen = false;
				}
			}
		}, false);

		// window.addEventListener(KEY_UP, function(e){
		// 	// if(typeof onKeyUp == 'function') onKeyUp(e);
		// });
	}

	/* View in fullscreen */
	function openFullscreen() {
		var elem = document.documentElement;
		if (elem.requestFullscreen != null) {
			elem.requestFullscreen();
		} else if (untyped elem.mozRequestFullScreen) { /* Firefox */
			untyped elem.mozRequestFullScreen();
		} else if (untyped elem.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
			untyped elem.webkitRequestFullscreen();
		} else if (untyped elem.msRequestFullscreen) { /* IE/Edge */
			untyped elem.msRequestFullscreen();
		}
	}

	/* Close fullscreen */
	function closeFullscreen() {
		if (document.exitFullscreen != null) {
			document.exitFullscreen();
		} else if (untyped document.mozCancelFullScreen) { /* Firefox */
			untyped document.mozCancelFullScreen();
		} else if (untyped document.webkitExitFullscreen) { /* Chrome, Safari and Opera */
			untyped document.webkitExitFullscreen();
		} else if (untyped document.msExitFullscreen) { /* IE/Edge */
			untyped document.msExitFullscreen();
		}
	}
}
