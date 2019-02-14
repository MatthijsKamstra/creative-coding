package lib.util;

/**
 * Math related stuff is found here
 * 		- radians & convertions
 * 		- degree & convertions
 * 		- etc
 *
 * @example
 * ```
 * import lib.util.MathUtil;
 * Mathlib.util.random (10);
 *
 * // or
 *
 * import lib.util.MathUtil.*;
 * random(10); // make it easier to read
 * ```
 *
 */
class MathUtil {

	static public function radians(deg:Float) {return deg * Math.PI / 180;};
	static public function degrees(rad:Float) {return rad * 180 / Math.PI;};

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

	/**
	 * calculate distance between two point (x,y)
	 * @param x1
	 * @param y1
	 * @param x2
	 * @param y2
	 */
	static public function distance(x1:Float, y1:Float, x2:Float, y2:Float):Float {
		return dist(x1, y1, x2, y2);
	}

	static public function dist(x1:Float, y1:Float, x2:Float, y2:Float) {
		x2 -= x1;
		y2 -= y1;
		return Math.sqrt((x2 * x2) + (y2 * y2));
	}

	/**
	 * calculate the circumference of a circle (omtrek)
	 * 	Omtrek = pi * diameter = 2 * pi * straal
	 *
	 * 	@example
	 * 		MathUtil.circumferenceCircle(10); // 62.83185307179586
	 *
	 * @param radius 	radius of circel
	 * @return Float	circumference
	 */
	static public function circumferenceCircle(radius:Float):Float {
		return Math.PI * radius * 2;
	}

	/**
		Oppervlakte = 1/4 * pi * diameter2 = pi * straal2
			 * 	@example
			 * 		MathUtil.areaCircle(10); // 62.83185307179586
			 * @param radius
			 * @return Float
	 */
	static public function areaCircle(radius:Float):Float {
		return Math.PI * Math.sqrt(radius);
	}

	/**
	 * Get a random number between `min` and `max`
	 *
	 * @example		lib.util.MathUtil.randomInteger(10,100); // producess an number between 10 and 100
	 *
	 * @param min 	minimum value
	 * @param max 	maximum value (optional: if not `max == min` and `min == 0` )
	 * @return Int	number between `min` and `max`
	 */
	static public function randomInteger(min:Int, ?max:Int):Int {
		if (max == null) {
			max = min;
			min = 0;
		}
		return Math.floor(Math.random() * (max + 1 - min)) + min;
	}

	static public function randomInt(min, ?max):Int {
		return randomInteger(min, max);
	}

	/**
	 * Get a random number between `min` and `max`
	 *
	 * @example		lib.util.MathUtil.random(10,100); // producess an number between 10 and 100
	 *
	 * @param min 	minimum value
	 * @param max 	maximum value
	 * @return Float	number between `min` and `max`
	 */
	static public function random(?min:Float, ?max:Float):Float {
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

	static public function chance(value) {
		return (random(value) > value - 1);
	}

	/**
	 * get value 1 or -1
	 */
	static public function posNeg() {
		return randomInt(0, 1) * 2 - 1;
	}

	/**
	 * calculate the angle between two point
	 * @param cx		center point x
	 * @param cy		center point y
	 * @param ex		end point x
	 * @param ey		end point y
	 * @return Float
	 */
	static public function angle(cx:Float, cy:Float, ex:Float, ey:Float):Float {
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
		var returnvalue = ((value - min1) / (max1 - min1) * (max2 - min2)) + min2;
		if (clampResult)
			return clamp(returnvalue, min2, max2);
		else
			return returnvalue;
	};

	static public function clamp(value, min, max) {
		return Math.min(Math.max(value, Math.min(min, max)), Math.max(min, max));
	}
	/**
		function xyz(px, py, pz, pitch, roll, yaw) {

		var cosa = Math.cos(yaw);
		var sina = Math.sin(yaw);

		var cosb = Math.cos(pitch);
		var sinb = Math.sin(pitch);

		var cosc = Math.cos(roll);
		var sinc = Math.sin(roll);

		var Axx = cosa*cosb;
		var Axy = cosa*sinb*sinc - sina*cosc;
		var Axz = cosa*sinb*cosc + sina*sinc;

		var Ayx = sina*cosb;
		var Ayy = sina*sinb*sinc + cosa*cosc;
		var Ayz = sina*sinb*cosc - cosa*sinc;

		var Azx = -sinb;
		var Azy = cosb*sinc;
		var Azz = cosb*cosc;

		x = Axx*px + Axy*py + Axz*pz;
		y = Ayx*px + Ayy*py + Ayz*pz;
		z = Azx*px + Azy*py + Azz*pz;

		return {x:x, y:y, z:z};
		}
	 */
}
