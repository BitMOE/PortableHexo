module.exports.cli = require('./bin/cmd')

module.exports.linter = Linter

var defaults = require('defaults')
var deglob = require('deglob')
var dezalgo = require('dezalgo')
var eslint = require('eslint')
var extend = require('xtend')
var findRoot = require('find-root')
var pkgConfig = require('pkg-config')

var DEFAULT_PATTERNS = [
  '**/*.js',
  '**/*.jsx'
]

var DEFAULT_IGNORE = [
  '**/*.min.js',
  '**/bundle.js',
  'coverage/**',
  'node_modules/**',
  'vendor/**'
]

function Linter (opts) {
  var self = this
  if (!(self instanceof Linter)) return new Linter(opts)
  opts = opts || {}
  self.cmd = opts.cmd || 'standard'
  self.eslintConfig = defaults(opts.eslintConfig, {
    useEslintrc: false,
    globals: []
  })
  if (!self.eslintConfig) {
    throw new Error('No eslintConfig passed.')
  }
}

/**
 * Lint text to enforce JavaScript Style.
 *
 * @param {string} text                   file text to lint
 * @param {Object=} opts                  options object
 * @param {Array.<string>=} opts.globals  global variables to declare
 * @param {string=} opts.parser           custom js parser (e.g. babel-eslint)
 * @param {function(Error, Object)} cb    callback
 */
Linter.prototype.lintText = function (text, opts, cb) {
  var self = this
  if (typeof opts === 'function') {
    cb = opts
    opts = {}
  }
  opts = self.parseOpts(opts)
  cb = dezalgo(cb)

  var result
  try {
    result = new eslint.CLIEngine(opts.eslintConfig).executeOnText(text)
  } catch (err) {
    return cb(err)
  }
  return cb(null, result)
}

/**
 * Lint files to enforce JavaScript Style.
 *
 * @param {Array.<string>} files          file globs to lint
 * @param {Object=} opts                  options object
 * @param {Array.<string>=} opts.ignore   file globs to ignore (has sane defaults)
 * @param {string=} opts.cwd              current working directory (default: process.cwd())
 * @param {Array.<string>=} opts.globals  global variables to declare
 * @param {string=} opts.parser           custom js parser (e.g. babel-eslint)
 * @param {function(Error, Object)} cb    callback
 */
Linter.prototype.lintFiles = function (files, opts, cb) {
  var self = this
  if (typeof opts === 'function') {
    cb = opts
    opts = {}
  }
  opts = self.parseOpts(opts)
  cb = dezalgo(cb)

  if (typeof files === 'string') files = [ files ]
  if (files.length === 0) files = DEFAULT_PATTERNS

  var deglobOpts = {
    ignore: opts.ignore,
    cwd: opts.cwd,
    useGitIgnore: true,
    usePackageJson: true,
    configKey: self.cmd
  }

  deglob(files, deglobOpts, function (err, allFiles) {
    if (err) return cb(err)
    // undocumented – do not use (used by bin/cmd.js)
    if (opts._onFiles) opts._onFiles(allFiles)

    var result
    try {
      result = new eslint.CLIEngine(opts.eslintConfig).executeOnFiles(allFiles)
    } catch (err) {
      return cb(err)
    }
    return cb(null, result)
  })
}

Linter.prototype.parseOpts = function (opts) {
  var self = this

  if (!opts) opts = {}
  opts = extend(opts)
  opts.eslintConfig = extend(self.eslintConfig)

  if (!opts.cwd) opts.cwd = process.cwd()

  if (!opts.ignore) opts.ignore = []
  opts.ignore = opts.ignore.concat(DEFAULT_IGNORE)

  setGlobals(opts.globals || opts.global)
  setParser(opts.parser)

  var root
  try { root = findRoot(opts.cwd) } catch (e) {}
  if (root) {
    var packageOpts = pkgConfig(self.cmd, { root: false, cwd: opts.cwd })

    if (packageOpts) {
      setGlobals(packageOpts.globals || packageOpts.global)
      if (!opts.parser) setParser(packageOpts.parser)
    }
  }

  function setParser (parser) {
    if (!parser) return
    opts.eslintConfig.parser = parser
  }

  function setGlobals (globals) {
    if (!globals) return
    opts.eslintConfig.globals = self.eslintConfig.globals.concat(globals)
  }

  return opts
}
