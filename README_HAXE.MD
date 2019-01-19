# Haxe and project Example Javascript

![](icon.png)

- [Project info](README.MD)
- [Haxe](#haxe)
- [Structure](#structure)
- [Build](#build)

Project info:

- project target 	: js
- project license 	: MIT
- project author 	: Matthijs Kamstra aka [mck]
- project website 	: 


<a href="haxe"></a>
## Haxe

This project is written in [Haxe](http://www.haxe.org) and transpiled to JavaScript.

> **The Cross-platform Toolkit**
Haxe is an open source toolkit based on a modern, high level, strictly typed programming language, a cross-compiler, a complete cross-platform standard library and ways to access each platform's native capabilities.

- Read more about [Haxe](http://www.haxe.org)?
- Or perhaps you just need a quick install: <http://matthijskamstra.github.io/haxejs/haxe/quick-install.html>.
- Perhaps you want a [Haxe editor](http://matthijskamstra.github.io/haxejs/haxe/quick-install.html#step-2-install-editor)?
- And install [MacDown](http://macdown.uranusjr.com/) to read and write Markdown (this document is written in it).

Confused? Go see a doctor!
Confused about Haxe? Please don't hesitate to ask [Matthijs Kamstra](mailto:matthijs@fonk.amsterdam)!

<a href="structure"></a>
## Structure

This is the short explanation about the folder structure and files

```
+ .vscode (files needed for Virtual Studio Code to work with Haxe)
+ bin (export folder)
	- build.hxml (default build file)
	- build_all.hxml (used to build multiple targets/release/debug)
	- build_release.hxml (build file without source-mapping/debug info/etc)
	- build_debug.hxml (probably the same as build.hxml)
+ src (source folder)
	- Main.hx (default starting point Haxe)
	- package.json (automatic build and Node.js file)
	- readme/icons/todo/git (nice to haves)
```

The `build.hxml` is the default build file. It transpiles the Haxe-code to a target (js, python, etc) language. It's probably the same as `build_debug.hxml`. It uses trace info, debug info, etc.

The `build_release.hxml` is the same as `build.hxml` but without debug info and release vars (for example `-D server=release`). It exports the data to the folder `bin_release`.

The `build_all.hxml` can be used to builds everything but default only build `build.hxml`

Haxe transpiles the files in the `src`-folder to the `bin`-folder.

Point your web-server (for example: [Mamp](https://www.mamp.info/) or similar tool) to the `bin` folder.
And open <http://localhost/> (or whatever name you give it like: <http://foobar:8888/>).


<a href="build"></a>
## Build

You need to install [Haxe](http://www.haxe.org), I have written a [quick-install-guide](http://matthijskamstra.github.io/haxejs/haxe/quick-install.html).

Once you have Haxe, you need to install the (Haxe) libs used in this project.

```
cd /path/to/folder/
haxelib install build.hxml
```

Build with Haxe (in terminal):

```
cd /path/to/folder/
haxe build.hxml
```

Install [NPM](http://matthijskamstra.github.io/haxejs/haxe/quick-install.html#step-5-extra-install-npm-node-js) if you want automated builds.

Automated build with terminal (after you installed NPM)

```
cd /path/to/folder/
npm run watch
```

If this is a node.js project, use the following code to install the node packages:

```
cd /path/to/folder/
npm install
```




