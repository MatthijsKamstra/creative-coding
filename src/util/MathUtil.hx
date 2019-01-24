package util;

class MathUtil {


	static public function radians(deg) {return deg*Math.PI/180;};
	static public function degrees(rad) {return rad*180/Math.PI;};

	// public function rotateDegrees(deg) {
	// 	this.rotate(radians(deg));
	// }

	// public function rotateDeg(deg) {
	// 	this.rotate(radians(deg));
	// }

	static public function degreesToPoint(deg, diameter) {
		var rad = Math.PI * deg / 180;
		var r = diameter / 2;
		return {x: r * Math.cos(rad), y: r * Math.sin(rad)};
	}

	static public function distributeAngles(me, total) {
		return me / total * 360;
	}

	static public function dist(x1, y1, x2, y2) {
		x2-=x1;
		y2-=y1;
		return Math.sqrt((x2*x2) + (y2*y2));
	}


	static public function randomInteger(min, max) {
		if(max == null) {
			max = min;
			min = 0;
		}
		return Math.floor(Math.random() * (max+1-min)) +min;
	}

	static public function random(?min, ?max) {
		if (min == null) {
			min = 0;
			max = 1;
		} else if (max == null) {
			max = min;
			min = 0;
		}
		return (Math.random() * (max - min)) + min;
	};

	static public function randomP(?min:Float, ?max:Float) {
		if (min == null) {
			min = 0.1;
			max = 1;
		} else if (max == null) {
			max = min;
			min = 0.1;
		}
		return (Math.random() * (max - min)) + min;
	};

	static public function randomInt(min, ?max) {
		if (max == null) {
			max = min;
			min = 0;
		}
		return Math.floor(Math.random() * (max + 1 - min)) + min;
	}

	static public function randomColour() {
		var r = randomInt(255);
		var g = randomInt(255);
		var b = randomInt(255);
		return ColorUtil.rgb(r, g, b);
	}


	static public function chance(value) {
		return (random(value) > value - 1);
	}

	static public function posNeg() {
		return randomInt(0, 1) * 2 - 1;
	}

	static public function angle(cx, cy, ex, ey) {
		var dy = ey - cy;
		var dx = ex - cx;
		var theta = Math.atan2(dy, dx); // range (-PI, PI]
		theta *= 180 / Math.PI; // rads to degs, range (-180, 180]
		if (theta < 0)
			theta = 360 + theta; // range [0, 360);
		if (theta == 360)
			theta = 0;
		return theta;
	}


	static public function map(value, min1, max1, min2, max2, clampResult) {
		var returnvalue = ((value-min1) / (max1 - min1) * (max2-min2)) + min2;
		if(clampResult) return clamp(returnvalue, min2, max2);
		else return returnvalue;
	};

	static public function clamp(value, min, max) {
		return Math.min(Math.max(value, Math.min(min, max)), Math.max(min, max));
	}

}