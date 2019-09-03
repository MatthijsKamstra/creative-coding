# Creative Coding

<p align="center">
  <img src="icon.jpg" />
</p>

I started this creative code library as a 30-days-chellange. I split the code up in [cc-sketch](https://github.com/MatthijsKamstra/cc-sketch) and examples that stayed here. I create the code with [Haxe](http://www.haxe.org) (I'm currently only focussing on the JavaScript target but with Haxe that could easily change). Do you want to know more about this beautiful programming language: [README_HAXE.MD](README_HAXE.MD)!

Most of my library code is inspired or based upon the work of George Gally, Seb Lee-Delisle, Matt DesLauriers (and probably many more) but they used a dynamic language (JavaScript) for. I want to us Haxe. So my start is a little bit slower converting everything to Haxe; a strictly typed language, but in the end this will help me to work faster.

You can seen my progress on this page: <https://matthijskamstra.github.io/creative-coding/>.

But if you don't want to see animations, and mouse interactions: I have created a [gallery](GALLERY.md) document.

This is not my first attempt, so if you want to check out my previous attempt: <http://matthijskamstra.github.io/gen-art/>. This attempt was to create pattern in `.svg`.

# Goal

It's good to set some goals when working on something

- [x] get started with creative-coding
- [x] work on it for 30 days (30 days challenge)
- [x] Instagram as primary way of distribution my sketches (social platform)
- [x] connect twitter via IFTTT and Instagram
- [x] create my own CC (creative coding) library based upon other artist work
- [x] create [30](GALLERY.md) animation/images that have a creative source
- [x] some sketches are just trying out code
- [x] after 30 sketches (animation/visuals), I will focus less on this magical number and focus on sketches with sound/video/api/
- [x] split code up ([cc-sketch](https://github.com/MatthijsKamstra/cc-sketch))
- [ ] have a talk about my experience
- [ ] get better at it (daily goal)

check my [todo](TODO.MD) from some indepth todo's about this experiment

## Inspiration

After reading the article of [George Gally](https://hackernoon.com/creative-coding-basics-4d623af1c647) it got me thinking.
Yes, I liked the way Flash worked as well. And all the stuff that Flash can do, modern browsers can do as wel.

So why not give it a try...

Read more <https://github.com/GeorgeGally/creative_coding>


## Color

I want to create mostly in black and white. But colours will be nice (sometimes... occasionally).
To make sure it will not cost too much time, I will be using:

- heavy lifting with colours I will be doing via `thx.color` or `hxColorToolkit`
- ColorUtil class
- predifined set of color pallets from Colour lovers: <https://github.com/mattdesl/nice-color-palettes>


## libs

This is Haxe specific, it's just here FYI

```
-lib hxquicksettings
-lib thx.color
-lib hxColorToolkit
-lib msignal
-lib mloader
-lib uglifyjs
```

and my own lib

```
-lib cc-sketch
```

[Read more about it](https://github.com/MatthijsKamstra/cc-sketch/blob/master/README.md)

## WIP

I am only focusing on getting it to work on Chrome... just giving you a heads-up!
And I am not concerned with optimisation: you fan will sometimes spike!
Perhaps also useful to know: resizing might have unexpected results... also not really focussing on

## TODO

I have created a [TODO.MD](TODO.MD), that keeps me in my IDE and helps structure progress.

Important stuff:

- [x] start lib
- [x] add animation engine
- [x] create navigation for sketches

### READ

liveserver `https`

- https://github.com/webisora/vscode-liveserver-https
- https://www.akadia.com/services/ssh_test_certificate.html
- https://webisora.com/blog/how-to-enable-https-on-live-server-visual-studio-code/

creative code

- https://github.com/terkelg/awesome-creative-coding
- https://github.com/sebleedelisle/CreativeJSLibs/blob/master/src/creative.js
- https://github.com/soulwire/sketch.js/wiki/API

dude!

- https://medium.com/@radarboy3000
- https://hackernoon.com/creative-coding-using-the-microphone-to-make-sound-reactive-art-part1-164fd3d972f3


### Sources:


- <div>Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" 			    title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
