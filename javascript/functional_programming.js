// run action on each element of array
function forEach(array, action){
  for(var i=0; i< array.length; i++){
    action(array[i]);
  }
}

// use for each to get sum of all elements
function sum(numbers){
  var sum = 0;
  forEach(numbers, function(number){
    sum += number;
  });
  return sum;
}

console.log(sum([1,2,3,4,5])) // 15

// STATEMENT
// - instruction to be EXECUTED BY BROWSER

// HIGHER ORDER FUNCTIONS
// - functions that operate on other functions
// - generalizes many algorithms that regular functions cannot easily describe
// - higher level of abstraction
// - can access any number of arguments passed into function with 'arguments' array

// use forEach
function reduce(combine, base, array){
  forEach(array, function(number){
    base = combine(base, number);
  });
  return base;
}

function add(a,b){
  return a + b;
}

// use reduce
function sum(numbers){
  return reduce(add, 0, numbers);
}

console.log(sum([1,2,3,4,5])) // 15

