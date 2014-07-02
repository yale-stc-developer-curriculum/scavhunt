// 1-fibonacci.tests.js

var getUrl=function(e,t){var n="http://scavhunt.herokuapp.com/clues/";var r="pond";var i=e.apply(this,t);var s=CryptoJS.MD5(i.toString());var o=s.toString();return n+r+"/"+o};QUnit.test("Simple [0]'s and [0, 1]'s",function(e){e.deepEqual(fibonacci(0),[0],"fibonacci(0) => [0]");e.deepEqual(fibonacci(1),[0,1],"fibonacci(1) => [0, 1]")});QUnit.test("Larger sequences",function(e){var t=[0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946,17711,28657,46368,75025,121393,196418,317811,514229,832040,1346269,2178309,3524578,5702887,9227465,14930352,24157817,39088169,63245986,102334155,165580141,267914296,433494437,701408733,1134903170,1836311903,2971215073,4807526976,7778742049,12586269025,20365011074,32951280099,53316291173,86267571272,139583862445,225851433717,365435296162,591286729879,956722026041,1548008755920,2504730781961,4052739537881,6557470319842,0x9a661ca20bb,0xf9d297a859d,27777890035288,44945570212853,72723460248141,0x6b04f4c2fe42,0xad2934c6d08f,308061521170129,498454011879264,806515533049393,0x4a2dce62b0d91,0x780626e057bc2,0xc233f54308953,5527939700884757,8944394323791464,0x336a82d89c937c,0x533163ef0321e4,0x869be6c79fb560,0xd9cd4ab6a2d740,99194853094755490,0x23a367c34e563e0,0x39a9fadb327f080,0x5d4d629e80d5480,0x96f75d79b354500,0xf444c0183429980,0x18b3c1d91e77de00,0x27f80ddaa1ba7800,466004661037553e4,0x68a3dd8e61ecd000,0xa94fad42221f2800,0x111f38ad0840c0000,319404346349901e5,5168070885485833e4,8362114348984843e4,0x755b0bdd8fa998000,2189229958345552e5,354224848179262e6];e.deepEqual(fibonacci(100),t,"fibonacci(100)");var n=function(e){if(e===0){return[0]}if(e===1){return[0,1]}var t=n(e-1);var r=t.length;return t.concat(t[r-1]+t[r-2])};for(var r=0;r<2e3;r+=75){if(r===1950){var i="Go to "+getUrl(fibonacci,[r]);e.deepEqual(fibonacci(r),n(r),i)}else{e.deepEqual(fibonacci(r),n(r),"fibonacci("+r+")")}}})