var chai = require('chai');
var expect = chai.expect;
chai.should();

var lib = require('../index.js');

describe('shout', function(){
  it('return passed string as uppercase', function(){
    expect(lib.shout('hello')).to.equal('HELLO');
  });
});

describe('whisper', function(){
  it('return passed string as lowercase', function(){
    expect(lib.whisper('heLLO')).to.equal('hello');
  });
});