# npm-wiredep
a fork of [wiredep](https://github.com/taptapship/wiredep) intended for injecting node-modules in a bower-like fashion
most instrucitons below are similar to that of [wiredep](https://github.com/taptapship/wiredep)

## Getting Started
Install the module with [npm](https://npmjs.org):


```bash
$ npm install --save npm-wiredep
```

## Changes from Wiredep
placeholders are renamed from bower/endbower to npm/endnpm

```html
<html>
<head>
  <!-- bower:css -->
  <!-- endbower -->
</head>
<body>
  <!-- bower:js -->
  <!-- endbower -->
</body>
</html>
```

Becomes

```html
<html>
<head>
  <!-- npm:css -->
  <!-- endnpm -->
</head>
<body>
  <!-- npm:js -->
  <!-- endnpm -->
</body>
</html>
```


## Package.json Requirements
for `npm-wiredep` to see the files which it needs to include, we need to list required in the `Files` array. Note, the files listed here are the only files that will appear in the node package

If there are no `Files` listed, then `npm-wiredep` will inject the path in the `main` string.

```js
//test-module
//dist/
//  *--css/
//      *--test.css
//  *--js/
//      *--test.js
{
  "name":"test-module",
  "version":"1.0.0",
  "main":"dist/index.js",
  "files":["dist/js/test.js","dist/css/test.css"],

}

```

## Configuration Changes
all other configuration options can be found at [wiredep](https://github.com/taptapship/wiredep)

```js
require('wiredep')({
  directory: 'the directory of your Npm packages.', // default: '.bowerrc'.directory || bower_components
  packageJson: 'your package.json file contents.',        // default: require('./package.json')
  src: ['filepaths', 'and/even/globs/*.html', 'to take', 'control of.'],

  // ----- Advanced Configuration -----
  // All of the below settings are for advanced configuration, to
  // give your project support for additional file types and more
  // control.
  //
  // Out of the box, wiredep will handle HTML files just fine for
  // JavaScript and CSS injection.

  cwd: 'path/to/where/we/are/pretending/to/be',

  dependencies: true,    // default: true
  devDependencies: true, // default: false
  includeSelf: true,     // default: false

  exclude: [ /jquery/, 'node_modules/modernizr/modernizr.js' ],

  ignorePath: /string or regexp to ignore from the injected filepath/

})


```



## License
Copyright for portions of project npm-wiredep are held by Stephen Sawchuk 2014 as part of wiredep. All other copyright for project npm-wiredep are held by David Viscomi 2017.
