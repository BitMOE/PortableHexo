chai = require('chai')
expect = chai.expect
unicodeLength = require('../lib/unicode-length')

describe 'Unicode Length:', ->

	describe '.get()', ->

		it 'should throw if no input', ->
			expect ->
				unicodeLength.get(null)
			.to.throw('Missing input')

		it 'should throw if input is not a string', ->
			expect ->
				unicodeLength.get(123)
			.to.throw('Invalid input: 123')

		it 'should return zero if empty string', ->
			expect(unicodeLength.get('')).to.equal(0)

		it 'should return the correct length of a string containing unicode symbols', ->
			result = unicodeLength.get('汉字')
			expect(result).to.equal(2)

		it 'should return the correct length of a string containing unicode symbols and colors', ->
			result = unicodeLength.get('\u001b[32m?\u001b[39m \u001b[1mWhat\'s your first name:\u001b[22m ')
			expect(result).to.equal(26)

