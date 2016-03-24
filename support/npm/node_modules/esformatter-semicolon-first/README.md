# esformatter-semicolon-first

[esformatter](https://github.com/millermedeiros/esformatter) plugin to add
semicolon before `[` and `(` if they are the first things on the line.

created mainly to be used by [standard-format](https://github.com/maxogden/standard-format)

## usage

Add to your esformatter config file:

```json
{
  "plugins": [
    "esformatter-semicolon-first"
  ]
}
```

Or you can manually register the plugin if not using `esformatter` directly:

```js
// register plugin
esformatter.register(require('esformatter-semicolon-first'));
```

## Examples

Given this input program:

```js
var x = 2
[1,2,3].map(function() {})

var y = 8
(function() {
  bar()
}())
```

It will output:

```js
var x = 2
;[1,2,3].map(function() {})

var y = 8
;(function() {
  bar()
}())
```

For more examples see the test files inside the `test/` folder.

## License

Released under the [MIT License](http://opensource.org/licenses/MIT).

