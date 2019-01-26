// Generated by Haxe 3.4.7
(function ($global) { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var AST = function() { };
AST.__name__ = ["AST"];
var CanvasTools = function() { };
CanvasTools.__name__ = ["CanvasTools"];
CanvasTools.square = function(ctx,x,y,width,height) {
	if(height == null) {
		height = width;
	}
	ctx.fillRect(x,y,width,height);
};
CanvasTools.centreStrokeRect = function(ctx,x,y,width,height) {
	if(height == null) {
		height = width;
	}
	ctx.strokeRect(x - width / 2,y - height / 2,width,height);
};
CanvasTools.centreFillRect = function(ctx,x,y,width,height) {
	if(height == null) {
		height = width;
	}
	ctx.fillRect(x - width / 2,y - height / 2,width,height);
};
CanvasTools.roundRect = function(ctx,_x,_y,_width,_height,_radius,_fill,_stroke) {
	if(_stroke == null) {
		_stroke = false;
	}
	if(_fill == null) {
		_fill = true;
	}
	if(_radius == null) {
		_radius = 5;
	}
	_width = Math.abs(_width);
	_height = Math.abs(_height);
	_x -= _width / 2;
	_y -= _height / 2;
	var radius_tr;
	var radius_tl;
	var radius_br;
	var radius_bl;
	radius_tl = _radius;
	radius_tr = _radius;
	radius_br = _radius;
	radius_bl = _radius;
	ctx.beginPath();
	ctx.moveTo(_x + radius_tl,_y);
	ctx.lineTo(_x + _width - radius_tr,_y);
	ctx.quadraticCurveTo(_x + _width,_y,_x + _width,_y + radius_tr);
	ctx.lineTo(_x + _width,_y + _height - radius_br);
	ctx.quadraticCurveTo(_x + _width,_y + _height,_x + _width - radius_br,_y + _height);
	ctx.lineTo(_x + radius_bl,_y + _height);
	ctx.quadraticCurveTo(_x,_y + _height,_x,_y + _height - radius_bl);
	ctx.lineTo(_x,_y + radius_tl);
	ctx.quadraticCurveTo(_x,_y,_x + radius_tl,_y);
	ctx.closePath();
	if(_fill) {
		ctx.fill();
	}
	if(_stroke) {
		ctx.stroke();
	}
};
CanvasTools.makeCircle = function(ctx,x,y,radius) {
	ctx.beginPath();
	ctx.arc(x,y,radius,0,Math.PI * 2,true);
};
CanvasTools.circle = function(ctx,x,y,radius) {
	CanvasTools.makeCircle(ctx,x,y,radius);
	ctx.fill();
	ctx.closePath();
};
CanvasTools.fillCircle = function(ctx,x,y,radius) {
	CanvasTools.makeCircle(ctx,x,y,radius);
	ctx.fill();
	ctx.closePath();
};
CanvasTools.strokeCircle = function(ctx,x,y,radius) {
	CanvasTools.makeCircle(ctx,x,y,radius);
	ctx.stroke();
	ctx.closePath();
};
CanvasTools.strokePolygon = function(ctx,x,y,sides,size) {
	CanvasTools.polygon(ctx,x,y,sides,size);
	ctx.stroke();
};
CanvasTools.fillPolygon = function(ctx,x,y,sides,size) {
	CanvasTools.polygon(ctx,x,y,sides,size);
	ctx.fill();
};
CanvasTools.outlinedPolygon = function(ctx,x,y,_sides,_size,_fill,_stroke) {
	ctx.fillStyle = _fill;
	CanvasTools.fillPolygon(ctx,x,y,_sides,_size);
	ctx.strokeStyle = _stroke;
	CanvasTools.strokePolygon(ctx,x,y,_sides,_size);
};
CanvasTools.polygon = function(ctx,x,y,sides,size) {
	ctx.beginPath();
	ctx.moveTo(x + size * Math.cos(0),y + size * Math.sin(0));
	var _g1 = 0;
	var _g = sides;
	while(_g1 < _g) {
		var i = _g1++;
		ctx.lineTo(x + size * Math.cos(i * 2 * Math.PI / sides),y + size * Math.sin(i * 2 * Math.PI / sides));
	}
};
CanvasTools.eellipse = function(ctx,x,y,width,height) {
	ctx.beginPath();
	var i = 0;
	var counter = 0;
	while(i < Math.PI * 2) {
		console.log("" + counter + ". - " + i + " < " + Math.PI * 2);
		ctx.lineTo(x + Math.cos(i) * width / 2,y + Math.sin(i) * height / 2);
		i += Math.PI / 16;
		++counter;
	}
	ctx.closePath();
};
CanvasTools.fillEllipse = function(ctx,x,y,width,height) {
	ctx.beginPath();
	ctx.ellipse(x,y,width,height,0,0,2 * Math.PI);
	ctx.fill();
};
CanvasTools.strokeEllipse = function(ctx,x,y,width,height) {
	ctx.beginPath();
	ctx.ellipse(x,y,width,height,0,0,2 * Math.PI);
	ctx.stroke();
};
CanvasTools.line = function(ctx,x1,y1,x2,y2) {
	ctx.beginPath();
	ctx.moveTo(x1,y1);
	ctx.lineTo(x2,y2);
	ctx.stroke();
	ctx.beginPath();
};
CanvasTools.triangle = function(ctx,x1,y1,x2,y2,x3,y3) {
	ctx.beginPath();
	ctx.moveTo(x1,y1);
	ctx.lineTo(x2,y2);
	ctx.lineTo(x3,y3);
	ctx.lineTo(x1,y1);
	ctx.stroke();
	ctx.closePath();
};
CanvasTools.strokeTriangle = function(ctx,x1,y1,x2,y2,x3,y3) {
	ctx.beginPath();
	ctx.moveTo(x1,y1);
	ctx.lineTo(x2,y2);
	ctx.lineTo(x3,y3);
	ctx.lineTo(x1,y1);
	ctx.stroke();
	ctx.closePath();
};
CanvasTools.fillTriangle = function(ctx,x1,y1,x2,y2,x3,y3) {
	ctx.beginPath();
	ctx.moveTo(x1,y1);
	ctx.lineTo(x2,y2);
	ctx.lineTo(x3,y3);
	ctx.lineTo(x1,y1);
	ctx.fill();
	ctx.closePath();
};
CanvasTools.eqDownFillTriangle = function(ctx,x,y,sz) {
	ctx.translate(x,y);
	ctx.rotate(util_MathUtil.radians(180));
	CanvasTools.fillTriangle(ctx,0,0 - sz,sz,sz / 2,0 - sz,sz / 2);
	ctx.rotate(util_MathUtil.radians(-180));
	ctx.translate(-x,-y);
};
CanvasTools.eqDownTriangle = function(ctx,x,y,sz) {
	ctx.translate(x,y);
	ctx.rotate(util_MathUtil.radians(180));
	CanvasTools.triangle(ctx,0,0 - sz,sz,sz / 2,0 - sz,sz / 2);
	ctx.rotate(util_MathUtil.radians(-180));
	ctx.translate(-x,-y);
};
CanvasTools.eqFillTriangle = function(ctx,x,y,sz) {
	CanvasTools.fillTriangle(ctx,x,y - sz,x + sz,y + sz / 2,x - sz,y + sz / 2);
};
CanvasTools.eqTriangle = function(ctx,x,y,sz) {
	CanvasTools.triangle(ctx,x,y - sz,x + sz,y + sz / 2,x - sz,y + sz / 2);
};
CanvasTools.strokeWeight = function(ctx,inPx) {
	ctx.lineWidth = inPx;
};
CanvasTools.fillColour = function(ctx,r,g,b,a) {
	CanvasTools.colour(ctx,r,g,b,a);
};
CanvasTools.colour = function(ctx,r,g,b,a) {
	var c = util_ColorUtil.getColour(r,g,b,a);
	ctx.fillStyle = c;
};
CanvasTools.strokeColour = function(ctx,r,g,b,a) {
	CanvasTools.lineColour(ctx,r,g,b,a);
};
CanvasTools.lineColour = function(ctx,r,g,b,a) {
	ctx.strokeStyle = util_ColorUtil.getColour(r,g,b,a);
};
CanvasTools.colourName = function(ctx,name) {
	ctx.fillStyle = name;
};
CanvasTools.background = function(ctx,r,g,b,a) {
	if(g == null) {
		ctx.fillStyle = util_ColorUtil.rgb(r,r,r);
	} else if(b == null && a == null) {
		ctx.fillStyle = util_ColorUtil.rgba(r,r,r,g);
	} else if(a == null) {
		ctx.fillStyle = util_ColorUtil.rgb(r,g,b);
	} else {
		ctx.fillStyle = util_ColorUtil.rgba(r,g,b,a);
	}
	ctx.fillRect(0,0,Global.w,Global.h);
};
Math.__name__ = ["Math"];
var Global = function() { };
Global.__name__ = ["Global"];
var Main = function() {
	window.document.addEventListener("DOMContentLoaded",function(event) {
		window.console.log("" + model_constants_App.NAME + " :: build: " + model_constants_App.BUILD);
		var ctx = Sketch.create("creative_code_mck");
		var hash = window.location.hash;
		hash = StringTools.replace(hash,"#","");
		switch(hash) {
		case "CC000":
			new art_CC000(ctx);
			break;
		case "CC001":
			new art_CC001(ctx);
			break;
		case "CC002":
			new art_CC002(ctx);
			break;
		case "CC003":
			new art_CC003(ctx);
			break;
		case "CC004":
			new art_CC004(ctx);
			break;
		case "CC005":
			new art_CC005(ctx);
			break;
		default:
			console.log("case '" + hash + "': new " + hash + "(ctx);");
			window.location.hash = "CC005";
			new art_CC005(ctx);
		}
		window.addEventListener("hashchange",function() {
			window.location.reload();
		},false);
	});
};
Main.__name__ = ["Main"];
Main.main = function() {
	var app = new Main();
};
Main.prototype = {
	__class__: Main
};
var Sketch = function() {
	this.document = window.document;
	this.window = window;
};
Sketch.__name__ = ["Sketch"];
Sketch.create = function(name,type) {
	if(type == null) {
		type = "2d";
	}
	new Sketch().init();
	if(type == "2d") {
		return new Sketch().createCanvas(name);
	} else {
		return new Sketch().createGLCanvas(name);
	}
};
Sketch.prototype = {
	createCanvas: function(canvas_name) {
		this.canvas = this.document.createElement("canvas");
		var body = this.document.querySelector("body");
		this.canvas.setAttribute("id",canvas_name);
		this.canvas.style.position = "absolute";
		this.canvas.style.left = "0px";
		this.canvas.style.top = "0px";
		body.appendChild(this.canvas);
		var ctx = this.canvas.getContext("2d");
		this.resize();
		this.window.addEventListener(Global.RESIZE,$bind(this,this.resize),false);
		return ctx;
	}
	,createGLCanvas: function(canvas_name) {
		this.canvas = this.document.createElement("canvas");
		var body = this.document.querySelector("body");
		this.canvas.setAttribute("id",canvas_name);
		this.canvas.style.position = "absolute";
		this.canvas.style.left = "0px";
		this.canvas.style.top = "0px";
		body.appendChild(this.canvas);
		var gl = this.canvas.getContext("webgl");
		if(gl == null) {
			var gl1 = this.canvas.getContext("experimental-webgl");
		}
		this.resize();
		this.window.addEventListener(Global.RESIZE,$bind(this,this.resize),false);
		return gl;
	}
	,resize: function() {
		var c = this.document.getElementsByTagName("canvas");
		Global.w = this.window.innerWidth;
		Global.h = this.window.innerHeight;
		var _g1 = 0;
		var _g = c.length;
		while(_g1 < _g) {
			var i = _g1++;
			var _c = c[i];
			_c.width = Global.w;
			_c.height = Global.h;
		}
		window.console.log("resize: " + Global.w + ":" + Global.h);
	}
	,createHiddenCanvas: function(canvas_name) {
		var ctx = this.createCanvas(canvas_name);
		this.canvas.style.left = -Global.w + "px";
		return ctx;
	}
	,init: function() {
		var _gthis = this;
		this.window.addEventListener(Global.MOUSE_MOVE,function(e) {
			Global.mouseX = e.clientX;
			Global.mouseY = e.clientY;
			Global.mouseMoved = true;
		});
		this.window.addEventListener(Global.MOUSE_DOWN,function(e1) {
			Global.mouseDown = true;
		});
		this.window.addEventListener(Global.MOUSE_UP,function(e2) {
			Global.mouseDown = false;
		});
		this.window.addEventListener(Global.KEY_DOWN,function(e3) {
			if(e3.metaKey == true && e3.key == "f") {
				if(!Global.isFullscreen) {
					_gthis.openFullscreen();
					Global.isFullscreen = true;
				} else {
					_gthis.closeFullscreen();
					Global.isFullscreen = false;
				}
			}
		},false);
	}
	,openFullscreen: function() {
		var elem = this.document.documentElement;
		if($bind(elem,elem.requestFullscreen) != null) {
			elem.requestFullscreen();
		} else if(elem.mozRequestFullScreen) {
			elem.mozRequestFullScreen();
		} else if(elem.webkitRequestFullscreen) {
			elem.webkitRequestFullscreen();
		} else if(elem.msRequestFullscreen) {
			elem.msRequestFullscreen();
		}
	}
	,closeFullscreen: function() {
		if(($_=this.document,$bind($_,$_.exitFullscreen)) != null) {
			this.document.exitFullscreen();
		} else if(this.document.mozCancelFullScreen) {
			this.document.mozCancelFullScreen();
		} else if(this.document.webkitExitFullscreen) {
			this.document.webkitExitFullscreen();
		} else if(this.document.msExitFullscreen) {
			this.document.msExitFullscreen();
		}
	}
	,__class__: Sketch
};
var StringTools = function() { };
StringTools.__name__ = ["StringTools"];
StringTools.replace = function(s,sub,by) {
	return s.split(sub).join(by);
};
var Type = function() { };
Type.__name__ = ["Type"];
Type.getClassName = function(c) {
	var a = c.__name__;
	if(a == null) {
		return null;
	}
	return a.join(".");
};
var art_CCBase = function(ctx) {
	this.isDrawActive = true;
	this.ctx = ctx;
	window.addEventListener(Global.RESIZE,$bind(this,this._reset),false);
	window.addEventListener(Global.KEY_DOWN,$bind(this,this._keyDown),false);
	window.addEventListener(Global.KEY_UP,$bind(this,this._keyUp),false);
	this.init();
	this._draw();
};
art_CCBase.__name__ = ["art","CCBase"];
art_CCBase.prototype = {
	_keyDown: function(e) {
	}
	,_keyUp: function(e) {
	}
	,_reset: function() {
		this.ctx.clearRect(0,0,Global.w,Global.h);
		this.init();
	}
	,_draw: function(timestamp) {
		this.draw();
		if(this.isDrawActive) {
			window.requestAnimationFrame($bind(this,this._draw));
		}
	}
	,init: function() {
	}
	,draw: function() {
		console.log("" + this.toString() + " :: override public function draw()");
	}
	,pause: function() {
		this.isDrawActive = !this.isDrawActive;
	}
	,stop: function() {
		this.isDrawActive = false;
	}
	,play: function() {
		this.isDrawActive = true;
	}
	,toString: function() {
		var className = Type.getClassName(js_Boot.getClass(this));
		return className;
	}
	,__class__: art_CCBase
};
var art_ICCBase = function() { };
art_ICCBase.__name__ = ["art","ICCBase"];
art_ICCBase.prototype = {
	__class__: art_ICCBase
};
var art_CC000 = function(ctx) {
	this.size = 10;
	this.rotate = 0;
	this.ypos = 10;
	this.xpos = 10;
	art_CCBase.call(this,ctx);
};
art_CC000.__name__ = ["art","CC000"];
art_CC000.__interfaces__ = [art_ICCBase];
art_CC000.__super__ = art_CCBase;
art_CC000.prototype = $extend(art_CCBase.prototype,{
	draw: function() {
		console.log("draw: " + this.toString());
		this.rotate++;
		this.size++;
		this.ctx.save();
		this.ctx.translate(Global.w / 2,Global.h / 2);
		this.ctx.rotate(this.rotate);
		CanvasTools.centreStrokeRect(this.ctx,0,0,this.size);
		this.ctx.restore();
		if(this.size >= 1000) {
			this.pause();
		}
	}
	,__class__: art_CC000
});
var art_CC001 = function(ctx) {
	art_CCBase.call(this,ctx);
};
art_CC001.__name__ = ["art","CC001"];
art_CC001.__interfaces__ = [art_ICCBase];
art_CC001.__super__ = art_CCBase;
art_CC001.prototype = $extend(art_CCBase.prototype,{
	draw: function() {
		console.log("draw: " + this.toString());
		CanvasTools.background(this.ctx,0,0,0);
		CanvasTools.fillColour(this.ctx,255,255,255);
		CanvasTools.fillCircle(this.ctx,Global.w / 2,Global.h / 2,100);
		this.pause();
	}
	,__class__: art_CC001
});
var art_CC002 = function(ctx) {
	art_CCBase.call(this,ctx);
};
art_CC002.__name__ = ["art","CC002"];
art_CC002.__interfaces__ = [art_ICCBase];
art_CC002.__super__ = art_CCBase;
art_CC002.prototype = $extend(art_CCBase.prototype,{
	draw: function() {
		console.log("draw: " + this.toString());
		CanvasTools.fillColour(this.ctx,util_ColorUtil.LIME.r,util_ColorUtil.LIME.g,util_ColorUtil.LIME.b);
		CanvasTools.fillEllipse(this.ctx,Global.w / 2,Global.h / 2,100,200);
		this.pause();
	}
	,__class__: art_CC002
});
var art_CC003 = function(ctx) {
	this.ballArray = [];
	this.sizeBall = 20;
	this.maxBalls = 10;
	art_CCBase.call(this,ctx);
};
art_CC003.__name__ = ["art","CC003"];
art_CC003.__interfaces__ = [art_ICCBase];
art_CC003.__super__ = art_CCBase;
art_CC003.prototype = $extend(art_CCBase.prototype,{
	init: function() {
		console.log("init: " + this.toString());
		CanvasTools.background(this.ctx,255,255,255,0.2);
		var _g1 = 0;
		var _g = this.maxBalls;
		while(_g1 < _g) {
			var i = _g1++;
			this.ballArray.push(this.createBall());
		}
	}
	,draw: function() {
		this.moveBall();
		this.drawBall();
	}
	,createBall: function() {
		var ball = { x : util_MathUtil.random(this.sizeBall / 2,Global.w - this.sizeBall / 2), y : util_MathUtil.random(this.sizeBall / 2,Global.h - this.sizeBall / 2), speed_x : util_MathUtil.random(-5,5), speed_y : util_MathUtil.random(-5,5), size : this.sizeBall, colour : util_ColorUtil.rgb(util_MathUtil.randomInt(55),util_MathUtil.randomInt(255),0)};
		return ball;
	}
	,moveBall: function() {
		var _g1 = 0;
		var _g = this.ballArray.length;
		while(_g1 < _g) {
			var i = _g1++;
			var b = this.ballArray[i];
			b.x += b.speed_x;
			b.y += b.speed_y;
			if(util_AnimateUtil.bounce(b.x,0,Global.w,b.size)) {
				b.speed_x *= -1;
				b.colour = util_ColorUtil.rgb(util_MathUtil.randomInt(55),util_MathUtil.randomInt(255),0);
			}
			if(util_AnimateUtil.bounce(b.y,0,Global.h,b.size)) {
				b.speed_y *= -1;
				b.colour = util_ColorUtil.rgb(0,util_MathUtil.randomInt(255),util_MathUtil.randomInt(55));
			}
		}
	}
	,drawBall: function() {
		var _g1 = 0;
		var _g = this.ballArray.length;
		while(_g1 < _g) {
			var i = _g1++;
			var b = this.ballArray[i];
			this.ctx.fillStyle = b.colour;
			CanvasTools.fillCircle(this.ctx,b.x,b.y,b.size);
		}
	}
	,__class__: art_CC003
});
var art_CC004 = function(ctx) {
	this.ballArray = [];
	this.sizeBall = 3;
	this.maxBalls = 200;
	this.maxDistance = 100;
	art_CCBase.call(this,ctx);
};
art_CC004.__name__ = ["art","CC004"];
art_CC004.__interfaces__ = [art_ICCBase];
art_CC004.__super__ = art_CCBase;
art_CC004.prototype = $extend(art_CCBase.prototype,{
	init: function() {
		console.log("" + this.toString() + " :: init()");
		this.ballArray = [];
		var _g1 = 0;
		var _g = this.maxBalls;
		while(_g1 < _g) {
			var i = _g1++;
			this.ballArray.push(this.createBall());
		}
	}
	,draw: function() {
		this.moveBall();
		this.ctx.clearRect(0,0,Global.w,Global.h);
		CanvasTools.background(this.ctx,0,0,0);
		this.drawBall();
	}
	,createBall: function() {
		var ball = { x : util_MathUtil.random(this.sizeBall / 2,Global.w - this.sizeBall / 2), y : util_MathUtil.random(this.sizeBall / 2,Global.h - this.sizeBall / 2), speed_x : util_MathUtil.random(-0.5,0.5), speed_y : util_MathUtil.random(-0.5,0.5), size : this.sizeBall, colour : util_ColorUtil.rgb(255,255,255)};
		return ball;
	}
	,moveBall: function() {
		var _g1 = 0;
		var _g = this.ballArray.length;
		while(_g1 < _g) {
			var i = _g1++;
			var b = this.ballArray[i];
			b.x += b.speed_x;
			b.y += b.speed_y;
			if(util_AnimateUtil.bounce(b.x,0,Global.w,b.size)) {
				b.speed_x *= -1;
			}
			if(util_AnimateUtil.bounce(b.y,0,Global.h,b.size)) {
				b.speed_y *= -1;
			}
		}
	}
	,drawBall: function() {
		var _g1 = 0;
		var _g = this.ballArray.length;
		while(_g1 < _g) {
			var i = _g1++;
			var b1 = this.ballArray[i];
			this.ctx.fillStyle = b1.colour;
			CanvasTools.fillCircle(this.ctx,b1.x,b1.y,b1.size);
			var _g3 = 0;
			var _g2 = this.ballArray.length;
			while(_g3 < _g2) {
				var j = _g3++;
				var b2 = this.ballArray[j];
				if(b1 == b2) {
					continue;
				}
				var _dist = util_MathUtil.distance(b1.x,b1.y,b2.x,b2.y);
				if(_dist < this.maxDistance) {
					var alpha = 0.8 - _dist / this.maxDistance;
					CanvasTools.lineColour(this.ctx,util_ColorUtil.WHITE.r,util_ColorUtil.WHITE.g,util_ColorUtil.WHITE.b,alpha);
					CanvasTools.line(this.ctx,b1.x,b1.y,b2.x,b2.y);
				}
			}
		}
	}
	,__class__: art_CC004
});
var art_CC005 = function(ctx) {
	art_CCBase.call(this,ctx);
};
art_CC005.__name__ = ["art","CC005"];
art_CC005.__interfaces__ = [art_ICCBase];
art_CC005.__super__ = art_CCBase;
art_CC005.prototype = $extend(art_CCBase.prototype,{
	init: function() {
		console.log("init: " + this.toString());
		var padding = 100;
		var arr = util_GridUtil.create(padding,padding,Global.w - 2 * padding,Global.h - 2 * padding,3,4);
		var _g1 = 0;
		var _g = arr.length;
		while(_g1 < _g) {
			var i = _g1++;
			var point = arr[i];
			util_ShapeUtil.registerPoint(this.ctx,point.x,point.y);
		}
		var _size = 50;
		var _width = _size;
		var _height = 25;
		CanvasTools.colour(this.ctx,util_ColorUtil.NAVY.r,util_ColorUtil.NAVY.g,util_ColorUtil.NAVY.b,0.5);
		var point1 = arr[0];
		CanvasTools.centreFillRect(this.ctx,point1.x,point1.y,_size,_size);
		var point2 = arr[1];
		CanvasTools.circle(this.ctx,point2.x,point2.y,_size);
		var point3 = arr[2];
		CanvasTools.fillEllipse(this.ctx,point3.x,point3.y,_width,_height);
		var point4 = arr[3];
		CanvasTools.lineColour(this.ctx,util_ColorUtil.NAVY.r,util_ColorUtil.NAVY.g,util_ColorUtil.NAVY.b,0.5);
		CanvasTools.line(this.ctx,point4.x,point4.y,point4.x + _width,point4.y + _height);
		var point5 = arr[4];
		CanvasTools.fillTriangle(this.ctx,point5.x,point5.y - _height,point5.x - _width,point5.y - _height,point5.x + _width,point5.y + _height);
		var point6 = arr[5];
		CanvasTools.fillPolygon(this.ctx,point6.x,point6.y,8,_size);
		var point7 = arr[6];
		CanvasTools.fillPolygon(this.ctx,point7.x,point7.y,3,_size);
		var point8 = arr[7];
		CanvasTools.eqDownFillTriangle(this.ctx,point8.x,point8.y,_size);
		var point9 = arr[8];
		CanvasTools.eqDownTriangle(this.ctx,point9.x,point9.y,_size);
		var point10 = arr[9];
		CanvasTools.roundRect(this.ctx,point10.x,point10.y,100,100,10);
	}
	,draw: function() {
		this.stop();
	}
	,__class__: art_CC005
});
var js_Boot = function() { };
js_Boot.__name__ = ["js","Boot"];
js_Boot.getClass = function(o) {
	if((o instanceof Array) && o.__enum__ == null) {
		return Array;
	} else {
		var cl = o.__class__;
		if(cl != null) {
			return cl;
		}
		var name = js_Boot.__nativeClassName(o);
		if(name != null) {
			return js_Boot.__resolveNativeClass(name);
		}
		return null;
	}
};
js_Boot.__nativeClassName = function(o) {
	var name = js_Boot.__toStr.call(o).slice(8,-1);
	if(name == "Object" || name == "Function" || name == "Math" || name == "JSON") {
		return null;
	}
	return name;
};
js_Boot.__resolveNativeClass = function(name) {
	return $global[name];
};
var model_constants_App = function() { };
model_constants_App.__name__ = ["model","constants","App"];
var util_AnimateUtil = function() {
};
util_AnimateUtil.__name__ = ["util","AnimateUtil"];
util_AnimateUtil.tween = function(pos,target,speed) {
	if(speed == null) {
		speed = 20;
	}
	pos += (target - pos) / speed;
	return pos;
};
util_AnimateUtil.bounce = function(num,min,max,sz) {
	if(sz == null) {
		sz = 0;
	}
	if(num >= max - sz / 2 || num - sz / 2 <= min) {
		return true;
	} else {
		return false;
	}
};
util_AnimateUtil.prototype = {
	__class__: util_AnimateUtil
};
var util_ColorUtil = function() {
};
util_ColorUtil.__name__ = ["util","ColorUtil"];
util_ColorUtil.getColour = function(r,g,b,a) {
	var c;
	if(g == null) {
		c = util_ColorUtil.rgb(r,r,r);
	} else if(b == null && a == null) {
		c = util_ColorUtil.rgba(r,r,r,g);
	} else if(a == null) {
		c = util_ColorUtil.rgb(r,g,b);
	} else {
		c = util_ColorUtil.rgba(r,g,b,a);
	}
	return c;
};
util_ColorUtil.rgb = function(r,g,b) {
	if(g == null) {
		g = r;
	}
	if(b == null) {
		b = r;
	}
	return "rgb(" + util_MathUtil.clamp(Math.round(r),0,255) + ", " + util_MathUtil.clamp(Math.round(g),0,255) + ", " + util_MathUtil.clamp(Math.round(b),0,255) + ")";
};
util_ColorUtil.rgba = function(r,g,b,a) {
	if(g == null) {
		return "rgb(" + util_MathUtil.clamp(Math.round(r),0,255) + ", " + util_MathUtil.clamp(Math.round(r),0,255) + ", " + util_MathUtil.clamp(Math.round(r),0,255) + ")";
	} else if(b == null) {
		return "rgba(" + util_MathUtil.clamp(Math.round(r),0,255) + ", " + util_MathUtil.clamp(Math.round(r),0,255) + ", " + util_MathUtil.clamp(Math.round(r),0,255) + ", " + util_MathUtil.clamp(g,0,1) + ")";
	} else if(a == null) {
		return "rgba(" + util_MathUtil.clamp(Math.round(r),0,255) + ", " + util_MathUtil.clamp(Math.round(g),0,255) + ", " + util_MathUtil.clamp(Math.round(b),0,255) + ", 1)";
	} else {
		return "rgba(" + util_MathUtil.clamp(Math.round(r),0,255) + ", " + util_MathUtil.clamp(Math.round(g),0,255) + ", " + util_MathUtil.clamp(Math.round(b),0,255) + ", " + util_MathUtil.clamp(a,0,1) + ")";
	}
};
util_ColorUtil.rgb2hex = function(r,g,b,a) {
	if(a == null) {
		a = 255;
	}
	return a << 24 | r << 16 | g << 8 | b;
};
util_ColorUtil.toRGB = function($int) {
	return { r : Math.round($int >> 16 & 255), g : Math.round($int >> 8 & 255), b : Math.round($int & 255)};
};
util_ColorUtil.ttoRGB = function($int) {
	return { r : $int >> 16 & 255, g : $int >> 8 & 255, b : $int & 255};
};
util_ColorUtil.prototype = {
	__class__: util_ColorUtil
};
var util_GridUtil = function() {
};
util_GridUtil.__name__ = ["util","GridUtil"];
util_GridUtil.create = function(x,y,width,height,numHor,numVer) {
	if(numVer == null) {
		numVer = 1;
	}
	if(numHor == null) {
		numHor = 1;
	}
	var gridW = width / (numHor - 1);
	var gridH = height / (numVer - 1);
	var total = numHor * numVer;
	var xpos = 0;
	var ypos = 0;
	var arr = [];
	var _g1 = 0;
	var _g = total;
	while(_g1 < _g) {
		var i = _g1++;
		var point = { x : x + xpos * gridW, y : y + ypos * gridH};
		arr.push(point);
		++xpos;
		if(xpos >= numHor) {
			xpos = 0;
			++ypos;
		}
	}
	return arr;
};
util_GridUtil.prototype = {
	__class__: util_GridUtil
};
var util_MathUtil = function() { };
util_MathUtil.__name__ = ["util","MathUtil"];
util_MathUtil.radians = function(deg) {
	return deg * Math.PI / 180;
};
util_MathUtil.degrees = function(rad) {
	return rad * 180 / Math.PI;
};
util_MathUtil.degreesToPoint = function(deg,diameter) {
	var rad = Math.PI * deg / 180;
	var r = diameter / 2;
	return { x : r * Math.cos(rad), y : r * Math.sin(rad)};
};
util_MathUtil.distributeAngles = function(me,total) {
	return me / total * 360;
};
util_MathUtil.distance = function(x1,y1,x2,y2) {
	return util_MathUtil.dist(x1,y1,x2,y2);
};
util_MathUtil.dist = function(x1,y1,x2,y2) {
	x2 -= x1;
	y2 -= y1;
	return Math.sqrt(x2 * x2 + y2 * y2);
};
util_MathUtil.randomInteger = function(min,max) {
	if(max == null) {
		max = min;
		min = 0;
	}
	return Math.floor(Math.random() * (max + 1 - min)) + min;
};
util_MathUtil.random = function(min,max) {
	if(min == null) {
		min = 0;
		max = 1;
	} else if(max == null) {
		max = min;
		min = 0;
	}
	return Math.random() * (max - min) + min;
};
util_MathUtil.randomP = function(min,max) {
	if(min == null) {
		min = 0.1;
		max = 1;
	} else if(max == null) {
		max = min;
		min = 0.1;
	}
	return Math.random() * (max - min) + min;
};
util_MathUtil.randomInt = function(min,max) {
	if(max == null) {
		max = min;
		min = 0;
	}
	return Math.floor(Math.random() * (max + 1 - min)) + min;
};
util_MathUtil.randomColour = function() {
	var r = util_MathUtil.randomInt(255);
	var g = util_MathUtil.randomInt(255);
	var b = util_MathUtil.randomInt(255);
	return util_ColorUtil.rgb(r,g,b);
};
util_MathUtil.chance = function(value) {
	return util_MathUtil.random(value) > value - 1;
};
util_MathUtil.posNeg = function() {
	return util_MathUtil.randomInt(0,1) * 2 - 1;
};
util_MathUtil.angle = function(cx,cy,ex,ey) {
	var dy = ey - cy;
	var dx = ex - cx;
	var theta = Math.atan2(dy,dx);
	theta *= 180 / Math.PI;
	if(theta < 0) {
		theta = 360 + theta;
	}
	if(theta == 360) {
		theta = 0;
	}
	return theta;
};
util_MathUtil.map = function(value,min1,max1,min2,max2,clampResult) {
	var returnvalue = (value - min1) / (max1 - min1) * (max2 - min2) + min2;
	if(clampResult) {
		return util_MathUtil.clamp(returnvalue,min2,max2);
	} else {
		return returnvalue;
	}
};
util_MathUtil.clamp = function(value,min,max) {
	return Math.min(Math.max(value,Math.min(min,max)),Math.max(min,max));
};
var util_ShapeUtil = function() { };
util_ShapeUtil.__name__ = ["util","ShapeUtil"];
util_ShapeUtil.cross = function(ctx,x,y,width,height) {
	if(height == null) {
		height = 60;
	}
	if(width == null) {
		width = 20;
	}
	ctx.fillRect(x - width / 2,y - height / 2,width,height);
	ctx.fillRect(x - height / 2,y - width / 2,height,width);
};
util_ShapeUtil.registerPoint = function(ctx,x,y) {
	var _w = 10;
	var _h = 10;
	var _d = 2;
	CanvasTools.colour(ctx,util_ColorUtil.PINK.r,util_ColorUtil.PINK.g,util_ColorUtil.PINK.b,1);
	ctx.fillRect(x - _w / 2,y - _d / 2,_w,_d);
	ctx.fillRect(x - _d / 2,y - _h / 2,_d,_h);
};
util_ShapeUtil.xcross = function(ctx,x,y,size) {
	if(size == null) {
		size = 200;
	}
	var size1 = 200;
	CanvasTools.strokeWeight(ctx,100);
	CanvasTools.line(ctx,x - size1 / 2,y - size1 / 2,x - size1 / 2 + size1,y - size1 / 2 + size1);
	CanvasTools.line(ctx,x + size1 - size1 / 2,y - size1 / 2,x - size1 / 2,y + size1 - size1 / 2);
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
String.prototype.__class__ = String;
String.__name__ = ["String"];
Array.__name__ = ["Array"];
Global.MOUSE_DOWN = "mousedown";
Global.MOUSE_UP = "mouseup";
Global.MOUSE_MOVE = "mousemove";
Global.KEY_DOWN = "keydown";
Global.KEY_UP = "keyup";
Global.RESIZE = "resize";
Global.mousePressed = 0;
Global.mouseReleased = 0;
Global.isFullscreen = false;
Global.TWO_PI = Math.PI * 2;
js_Boot.__toStr = ({ }).toString;
model_constants_App.NAME = "Creative Code [mck]";
model_constants_App.BUILD = "2019-01-27 00:39:26";
util_ColorUtil.NAVY = { r : Math.round(0), g : Math.round(31), b : Math.round(63)};
util_ColorUtil.BLUE = { r : Math.round(0), g : Math.round(116), b : Math.round(217)};
util_ColorUtil.AQUA = { r : Math.round(127), g : Math.round(219), b : Math.round(255)};
util_ColorUtil.TEAL = { r : Math.round(57), g : Math.round(204), b : Math.round(204)};
util_ColorUtil.OLIVE = { r : Math.round(61), g : Math.round(153), b : Math.round(112)};
util_ColorUtil.GREEN = { r : Math.round(46), g : Math.round(204), b : Math.round(64)};
util_ColorUtil.LIME = { r : Math.round(1), g : Math.round(255), b : Math.round(112)};
util_ColorUtil.YELLOW = { r : Math.round(255), g : Math.round(220), b : Math.round(0)};
util_ColorUtil.ORANGE = { r : Math.round(255), g : Math.round(133), b : Math.round(27)};
util_ColorUtil.RED = { r : Math.round(255), g : Math.round(65), b : Math.round(54)};
util_ColorUtil.MAROON = { r : Math.round(133), g : Math.round(20), b : Math.round(75)};
util_ColorUtil.FUCHSIA = { r : Math.round(240), g : Math.round(18), b : Math.round(190)};
util_ColorUtil.PURPLE = { r : Math.round(177), g : Math.round(13), b : Math.round(201)};
util_ColorUtil.BLACK = { r : Math.round(17), g : Math.round(17), b : Math.round(17)};
util_ColorUtil.GRAY = { r : Math.round(170), g : Math.round(170), b : Math.round(170)};
util_ColorUtil.SILVER = { r : Math.round(221), g : Math.round(221), b : Math.round(221)};
util_ColorUtil.WHITE = { r : Math.round(255), g : Math.round(255), b : Math.round(255)};
util_ColorUtil.PINK = { r : Math.round(255), g : Math.round(20), b : Math.round(147)};
util_ColorUtil.PINK_DEEP = { r : Math.round(255), g : Math.round(20), b : Math.round(147)};
util_ColorUtil.PINK_HOT = { r : Math.round(255), g : Math.round(105), b : Math.round(180)};
Main.main();
})(typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this);

//# sourceMappingURL=cc_mck.js.map