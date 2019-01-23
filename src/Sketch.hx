package;

import js.Browser.*;
import js.Browser;
import js.html.*;

import js.html.CanvasElement;

import Global.*;

class Sketch {

	// https://github.com/GeorgeGally/creative_coding/blob/master/js/canvas.js


	var canvas : js.html.CanvasElement;

	public function new() {	}

	public static function create (name:String, ?type:String = '2d'):CanvasRenderingContext2D{

		var cc = new CC();

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

}