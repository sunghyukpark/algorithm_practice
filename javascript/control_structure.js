// &&, || for short-circut login
// var name = o && o.getName()

var otherName;
console.log(typeof otherName); // undefined
var name = otherName || "default";
console.log(name); // "default"


