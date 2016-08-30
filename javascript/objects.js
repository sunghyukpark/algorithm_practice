console.log(typeof null) // object
console.log(typeof undefined) // undefined



// Object Literal
var obj = {
  name: "Carror",
  "for": "Max",
  details : {
    color: "orange",
    size: 12
  }
}

console.log(obj.details.color)












// JS primitives
// 1. Number
// 2. String
// 3. Boolean
// 4. Function
// 5. Object - Function, Array, Date, RegExp
// 6. Symbol

console.log(typeof undefined) // undefined
console.log(typeof null) //object
console.log(typeof []) // object
console.log(typeof {}) // object


function foo(){
  console.log(arguments)
}

foo(1,2) // {'0': 1, '1': 2}


// Numbers
parseInt("11", 10);
parseInt("hello", 10); // NaN
isFinite(NaN); // false


// Strings
"hello".length;
"hello".charAt(0);
"hello, world".replace("hello", "goodbye");
"hello".toUpperCase();


// Comparisons
console.log(7> "5")
console.log(4 > false)
console.log(1 == true)
console.log(1 >= true)


// Identity comparison with no type conversion

console.log({}==={}) // false
var x = {}
var y = {}
console.log(x === x) // True, same type
console.log("here")
console.log(x === y) // false
console.log(7==="7") // false

console.log('foo' === 'foo') // true as both operands are Type String (string primitive)

var a = new String('foo');
var b = new String('foo');

// string
console.log(typeof 'foo')

// object
console.log(typeof a)

// false, a,b both Type Object, refer different objects
console.log(a == b)

// false, same reason
console.log(a === b)

// True, Object 'a' converted to string before comparison
console.log(a == 'foo')

// False, of diff type
console.log(a === 'foo')










