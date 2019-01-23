package util;

import js.html.CanvasRenderingContext2D;

class DrawUtil extends CanvasRenderingContext2D{

	private var ctx : CanvasRenderingContext2D;

	public function new(ctx:CanvasRenderingContext2D) {
		this.ctx = ctx;
	}

	public function square (x:Int, y:Int, width:Int, ?height:Int) {
		if (height == null) height = width;
		this.ctx.fillRect(x, y, width, height);
	};


	/**
	 * Circles
	 */

	public function makeCircle (x, y, radius) {
		this.ctx.beginPath();
		this.ctx.arc(x, y, radius/2, 0, Math.PI*2, true);
	};

	public function circle (x, y, radius) {
		this.makeCircle(x, y, radius);
		this.ctx.fill();
		this.ctx.closePath();
	};

	public function fillCircle (x, y, radius) {
		this.makeCircle(x, y, radius);
		this.ctx.fill();
		this.ctx.closePath();
	};

	public function strokeCircle (x, y, radius) {
		this.makeCircle(x, y, radius);
		this.ctx.stroke();
		this.ctx.closePath();
	};




	public function triangle(x1:Int, y1:Int, x2:Int, y2:Int, x3:Int, y3:Int) {
		this.ctx.beginPath();
		this.ctx.moveTo(x1, y1);
		this.ctx.lineTo(x2, y2);
		this.ctx.lineTo(x3, y3);
		this.ctx.lineTo(x1, y1);
		this.ctx.stroke();
		this.ctx.closePath();
	};

}