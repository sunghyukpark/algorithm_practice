// Recursive

console.time('Recursive');
var power = function(base, exponent){
  if (exponent == 0)
    return 1;
  else
    return base * power(base, exponent-1)
}
console.timeEnd('Recursive')


// Iterative

console.time('Iterative')
var powerIterative = function(base, exponent){
  if (exponent == 0)
    return 1;
  var result = 1;
  for (var i = 0; i < exponent; i++){
    result *= base;
  }
  return result;
}
console.timeEnd('Iterative')


console.log(power(2,1000))
console.log(powerIterative(2,1000))
