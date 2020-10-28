vanilla js

```js
var c = document.getElementById("canvas-wrapper");
var ctx = canvas.getContext("2d");
ctx.beginPath();
ctx.fillStyle = "rgb(255,255,255)";
ctx.arc(100, 75, 50, 0, Math.PI * 2, true);
ctx.fill();
ctx.closePath();
```

```haxe
ctx.fillColour(255, 255, 255);
ctx.fillCircle(100, 75, 50);
```

```haxe
var	canvas = document.createCanvasElement();
var	canvas.setAttribute("id", "creative_code_mck");
// setup canvas
var option = new SketchOption();
option.width = 1080; // makes it square
option.padding = 10;
option.scale = true;
var ctx = Sketch.create("creative_code_mck", option);
```

## motion

```haxe
Go.to(sh, 3)
    .delay(2)
    .prop('angle', -(180 / 2) * count)
    .ease(Elastic.easeInOut)
    .onComplete(onAnimationContinue, [sh, id, ++count]);


```

```haxe
Go.to(arc, random)
    .x(w/2)
    .y(h/2)
    .ease(Sine.easeInOut)
    .onComplete(onAnimateHandler, [arc]);
```

```haxe
Go.to(_shape, 2)
    .x(_shape.x + (w - _shape.x*2))
    .delay(.7)
    .rotation(360)
    .yoyo();
```

```haxe
Go.to(line, random(2, 4))
    .prop('radius', random(radius0, radius1))
    .ease(Sine.easeInOut)
    .onComplete(onCompleteHandler, [line]);
```
