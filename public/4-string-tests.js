// 4-string-tests.js

var getUrl=function(e,t){var n="http://scavhunt.herokuapp.com/clues/";var r="bass";var i=e.apply(this,t);var s=CryptoJS.MD5(i.toString());var o=s.toString();return n+r+"/"+o};QUnit.test("Reverses two strings",function(e){e.deepEqual(reverseOrderStrings(["1","2"]),"21","Fail!")});QUnit.test("Stress/Clue",function(e){var t=_.map(_.range(100),function(e){return e.toString()});var n=reverseOrderStrings(t);var r=t.join("");e.deepEqual(n,r);e.ok(true,getUrl(reverseOrderStrings,[t]))})
