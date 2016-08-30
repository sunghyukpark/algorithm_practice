// Inner functions
// - If a function relies on one or two other functions that are not useful to any other part of your code, you can nest those utility functions inside the function that will be called from elsewhere. This keeps the number of functions that are in the GLOBAL SCOPE DOWN, which is always a good thing.

// Nested functions can SHARE VARIABLES IN THEIR PARENT, so you can use that mechanism to couple functions together when it makes sense without polluting your global namespace — "local globals" if you like. This technique should be used with caution, but it's a useful ability to have.

// CLOSURE
// var makeAdder = function(adder){
//   return function(base){
//     return base + adder;
//   };
// }

function makeAdder(adder){
  return function(base){
    return base + adder
  }
}

var addTwo = makeAdder(2)
console.log(addTwo) //[Function]
console.log(addTwo(3)) // 5


function makeMultiplier(multiplier){
  return function(base){
    return base * multiplier
  }
}

var twice = makeMultiplier(2)
console.log(twice) // [Function]
console.log(twice(5)) // 10


// From MDN
// myFunc has become a closure that wraps around local variables

function makeFunc(){
  var name = "Mozilla";
  function displayName(){
    console.log(name);
  }
  return displayName;
}

// [Function: displayName]
console.log(makeFunc())
// Mozilla
var myFunc = makeFunc()
myFunc();


// Emulating private methods
var counter = (function(){
  var privateCounter = 0;
  function changeBy(val){
    privateCounter += val;
  }
  return {
    increment : function(){
      changeBy(1);
    },
    decrement : function(){
      changeBy(-1);
    },
    value : function(){
      return privateCounter;
    }
  }
})();


console.log(counter.value()); // logs 0
counter.increment();
counter.increment();
console.log(counter.value()); // logs 2
counter.decrement();
console.log(counter.value()); // logs 1


console.log("break")

var text = "outside"
function logIt(){
  console.log(text)
  var text = "inside"

}