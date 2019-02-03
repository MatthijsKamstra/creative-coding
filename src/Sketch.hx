package;

import js.Browser.*;
import js.Browser;
import js.html.*;
import js.html.MouseEvent;
import js.html.Event;
import js.html.CanvasElement;
import lib.Global.*;

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
	public var ctx:CanvasRenderingContext2D;

	public function new() {}

	public static function create(name:String, ?option:SketchOption):CanvasRenderingContext2D {
		if (option == null) {
			option = new SketchOption();
		}
		if (option.type == SketchType.CANVAS) {
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
		ctx = canvas.getContext('2d');
		new Sketch().init(ctx);
		resize();
		window.addEventListener(RESIZE, resize, false);
		return ctx;
	}

	public function createGLCanvas(canvas_name):CanvasRenderingContext2D {
		// canvas = document.createCanvasElement();
		// var body = document.querySelector('body');
		// canvas.setAttribute("id", canvas_name);
		// canvas.style.position = "absolute";
		// canvas.style.left = "0px";
		// canvas.style.top = "0px";
		// body.appendChild(canvas);
		// var gl:CanvasRenderingContext2D = canvas.getContext('webgl');
		// new Sketch().init();
		// if (gl == null)
		// 	var gl = canvas.getContext('experimental-webgl');
		// resize();
		// window.addEventListener(RESIZE, resize, false);
		// return gl;
		return null;
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

	private function init(?ctx:CanvasRenderingContext2D) {
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
			e.preventDefault();
			e.stopPropagation();
			// trace(e);
			if (e.metaKey == true && e.key == 'r'){
				trace('cmd + r');
				location.reload();
			}
			if (e.metaKey == true && e.key == 's' && e.shiftKey == false){
				trace('cmd + s');
				lib.util.ExportUtil.downloadImage(ctx, true);
			}
			if (e.metaKey == true && e.key == 's' && e.shiftKey == true){
				trace('cmd + shift + s');
				lib.util.ExportUtil.downloadImage(ctx, false);
			}
			if (e.metaKey == true && untyped e.code == 'KeyS' && e.altKey == true){
				trace('cmd + alt + s');
				lib.util.ExportUtil.onBase64Handler(ctx, true);
			}

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

@:enum abstract SketchType(String) {
	var CANVAS = 'canvas';
	var WEBGL = 'webgl';
	var DOM = 'dom';
}
@:enum abstract PaperSize(String) {
	var A6 = 'A6';
	var A5 = 'A5';
	var A4 = 'A4';
	var A3 = 'A3';
	var A2 = 'A2';
	var A1 = 'A1';
}
// https://github.com/soulwire/sketch.js/wiki/API#options
class SketchOption {

	// fullscreen Default: true; when false, you can pass width: 500, height: 500 to specify a size.
	public var fullscreen ( get_fullscreen , set_fullscreen ) : Bool;
	private var _fullscreen : Bool = true;
	function get_fullscreen () : Bool { return _fullscreen; }
	function set_fullscreen(value : Bool) : Bool { return _fullscreen = value; }

	// autoclear Default: true Whether to clear the context before each call to draw. Otherwise call clear()
	public var autoclear ( get_autoclear , set_autoclear ) : Bool;
	private var _autoclear : Bool = true;
	function get_autoclear () : Bool { return _autoclear; }
	function set_autoclear(value : Bool) : Bool { return _autostart = value;}

	// autostart Default: true Otherwise call start()
	public var autostart ( get_autostart , set_autostart ) : Bool;
	private var _autostart : Bool = true;
	function get_autostart () : Bool { return _autostart;}
	function set_autostart(value : Bool) : Bool { return _autostart = value;}

	// autopause Default: true Whether to pause the animation on window blur and resume on focus
	public var autopause ( get_autopause , set_autopause ) : Bool;
	private var _autopause : Bool = true;
	function get_autopause () : Bool { return _autopause;}
	function set_autopause(value : Bool) : Bool { return _autopause = value;}

	// container Default: document.body Where to put the sketch context
	public var container ( get_container , set_container ) : js.html.Element;
	private var _container : js.html.Element = document.body;
	function get_container () : js.html.Element { return _container; }
	function set_container(value : js.html.Element) : js.html.Element { return _container = value; }

	// type Default Sketch.CANVAS Possible values: Sketch.CANVAS, Sketch.WEB_GL and Sketch.DOM
	public var type ( get_type , set_type ) : SketchType;
	private var _type : SketchType = SketchType.CANVAS;
	function get_type () : SketchType { return _type; }
	function set_type(value : SketchType) : SketchType { return _type = value; }

	// interval Default: 1 The update / draw interval (2 will update every 2 frames, etc)
	// globals Default: true Add global properties and methods to the window
	// retina Default: false Resize for best appearance on retina displays. Can be slow due to so many pixels!
	// eventTarget If you want Sketch to bind mouse events to an element other than the Sketch canvas, you can specify that ele

	public function new() {	}



}

