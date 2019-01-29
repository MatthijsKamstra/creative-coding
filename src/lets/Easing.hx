package lets;

class Easing {
	static inline public function linear(v:Float):Float {
		return v;
	}

	static inline public function quad(v:Float):Float {
		return v * v;
	}

	static inline public function cubic(v:Float):Float {
		return v * v * v;
	}

	static inline public function quart(v:Float):Float {
		return v * v * v;
	}

	static inline public function quint(v:Float):Float {
		return v * v * v;
	}

	static inline public function sine(v:Float):Float {
		return 1 - Math.cos(v * Math.PI / 2);
	}

	static inline public function circ(v:Float):Float {
		return 1 - Math.sqrt(1 - v * v);
	}

	static inline public function expo(v:Float):Float {
		return (v == 0) ? 0 : Math.pow(2, 10 * (v - 1));
	}

	static inline public function back(v:Float):Float {
		var s = 1.70158;
		return v * v * ((s + 1) * v - s);
	}

	static inline public function bounce(v:Float):Float {
		v = 1 - v;
		return 1 - if (v < (1 / 2.75)) (7.5625 * v * v)
		else if (v < (2 / 2.75)) (7.5625 * (v -= (1.5 / 2.75)) * v + .75)
		else if (v < (2.5 / 2.75)) (7.5625 * (v -= (2.25 / 2.75)) * v + .9375)
		else
			(7.5625 * (v -= (2.625 / 2.75)) * v + .984375);
	}

	static inline public function elastic(v:Float):Float {
		if (v == 0)
			return 0;
		if (v == 1)
			return 1;
		var p = .3;
		var s = p / 4;

		return -(Math.pow(2, 10 * (v -= 1)) * Math.sin((v - 0.075) * (2 * Math.PI) / 0.3));
	}

	static public function reverse(f:Float->Float):Float->Float {
		return function(v:Float):Float {
			return 1 - f(1 - v);
		}
	}

	static public function reflect(f:Float->Float):Float->Float {
		return function(v:Float):Float {
			return if (v < 0.5) {
				f(v * 2) / 2;
			} else {
				1 - f(2 - v * 2) / 2;
			}
		}
	}
}
