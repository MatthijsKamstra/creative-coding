package;

import js.Browser.*;
import js.Browser;
import js.html.*;
import js.html.MouseEvent;
import js.html.Event;
import js.html.CanvasElement;

import Global.*;

class Sketch {

	public var window = js.Browser.window;
	public var document = js.Browser.document;

	public var MOUSE_DOWN : String = 'mousedown';
	public var MOUSE_UP : String = 'mouseup';
	public var MOUSE_MOVE : String = 'mousemove';
	public var KEY_DOWN : String = 'keydown';
	public var KEY_UP : String = 'keyup';

	// https://github.com/GeorgeGally/creative_coding/blob/master/js/canvas.js

	var canvas : js.html.CanvasElement;

	public function new() {	}

	public static function create (name:String, ?type:String = '2d'):CanvasRenderingContext2D{

		new Sketch().init();

		if(type == '2d'){
			return new Sketch().createCanvas(name);
		} else {
			return new Sketch().createGLCanvas(name);
			// trace('return new Sketch().createGLCanvas(name);');
			// return null;
		}
	}

	// this enables me to have many canvases all positioned on top of eachother at 100% width and height of page
	public function createCanvas(canvas_name):CanvasRenderingContext2D{
		canvas = document.createCanvasElement();
		var body = document.querySelector('body');
		canvas.setAttribute("id", canvas_name);
		canvas.style.position = "absolute";
		canvas.style.left = "0px";
		canvas.style.top = "0px";
		body.appendChild(canvas);
		var ctx : CanvasRenderingContext2D = canvas.getContext('2d');
		resize();
		window.addEventListener("resize", resize, false);
		return ctx;
	}


	public function createGLCanvas(canvas_name):CanvasRenderingContext2D{
		canvas = document.createCanvasElement();
		var body = document.querySelector('body');
		canvas.setAttribute("id", canvas_name);
		canvas.style.position = "absolute";
		canvas.style.left = "0px";
		canvas.style.top = "0px";
		body.appendChild(canvas);
		var gl : CanvasRenderingContext2D = canvas.getContext('webgl');
		if (gl == null) var gl = canvas.getContext('experimental-webgl');
		resize();
		window.addEventListener("resize", resize, false);
		return gl;
	}

	function resize(){
		var c : Array<CanvasElement> = cast document.getElementsByTagName('canvas');
		width = w = window.innerWidth;
		height = h = window.innerHeight;
		for (i in 0...c.length){
			var _c = c[i];
			_c.width = width;
			_c.height = height;
		}
		console.log("resize: " + w +":" + h);
	}


	function createHiddenCanvas(canvas_name){
		var ctx = createCanvas(canvas_name);
		canvas.style.left = -w+"px";
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

		window.addEventListener(MOUSE_DOWN, function(e){

			mouseDown = true;

			trace('${mouseDown}');
			// if(typeof onMouseDown == 'function') onMouseDown();
		});

		window.addEventListener(MOUSE_UP, function(e){
			mouseDown = false;
			trace('${mouseDown}');
			// if(typeof onMouseUp == 'function') onMouseUp();
		});

		window.addEventListener(KEY_DOWN, function(e){
			keyDown = e;
			// if(typeof onKeyDown == 'function') onKeyDown(e);
		});

		window.addEventListener(KEY_UP, function(e){
			// if(typeof onKeyUp == 'function') onKeyUp(e);
		});



	}



	// document.onmousedown = function() {
	// 	mousePressed = 1;
	// 	//window.mousePressed();
	// }
	// document.onmouseup = function() {
	// 	mousePressed = 0;
	// 	mouseReleased = 1;
	// 	//window.mouseup();
	// }

}