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
