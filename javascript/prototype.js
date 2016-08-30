// Object-Oriented Javascript
// OOP - uses abstraction to create models based on the real world.

// Modularity
// The term Modularity refers to the degree to which a system's components may be SEPERATED and RECOMBINED, it is also division of a software package into logical units. The advantage of a modular system is that one can reason the parts independently

// Polymorphism
// Polymorphism is the presentation of ONE INTERFACE for MULTIPLE DATA TYPES.
// For example, integers, floats, and doubles are implicitly polymorphic: regardless of their different types, they can all be added, subtracted, multiplied, and so on.
// In the case of OOP, by making the class responsible for its code as well as its own data, polymorphism can be achieved in that each class has its own function that (once called) behaves properly for any object.

// Encapsulation
// Encapsulation is the packing of data and functions into one component (for example, a class) and then controlling access to that component to make a "blackbox" out of the object. Because of this, a user of that class only needs to know its interface (that is, the data and functions exposed outside the class), not the hidden implementation.



// What is Prototype?
// Javascript prototype -> bags of properties
// objects have link to a prototype object


// Inheriting properties

// Inheriting "methods"
var o = {
  a: 2,
  m: function(b){
    return this.a + 1;
  }
}
console.log(o.m()); // 3

var p = Object.create(o);
p.a = 12;
console.log(p.m());

// Different ways to create objects and the
// resulting prototype chain
// Person.prototype is an OBJECT shared by all instances of Person.
// - forms part of a lookup chain called prototype chain
// - root of prototype chain is Object.prototype


var s = "Simon";
// s.reverse();

String.prototype.reverse = function reverse(){
  var r = "";
  for(var i=this.length-1; i>= 0 ;i--){
    r += this[i];
  }
  return r;
}

console.log(s.reverse())

// Prototypical Inheritance
var Person = function(firstName, lastName){
  this.firstName = firstName;
  this.lastName = lastName;
  this.canTalk = true;
}

Person.prototype.fullName = function fullName(){
  return this.firstName + ' ' + this.lastName;
}

Person.prototype.reverseFullName = function reverseFullName(){
  return this.lastName + ' ' + this.firstName;
}


Person.prototype.walk = function(){
  console.log("I'm walking");
}

Person.prototype.sayHello = function(){
  if(this.canTalk)
    console.log("Hello, I'm " + this.firstName);
}

// var sunghyuk = new Person("Sunghyuk", "Park");
// console.log(sunghyuk.firstName); // Sunghyuk
// console.log(sunghyuk.lastName); // Park
// console.log(sunghyuk.fullName()); // Sunghyuk Park
// console.log(sunghyuk.reverseFullName()); // Park Sunghyuk
// sunghyuk.walk();
// sunghyuk.sayHello();


// Student inherits Person
var Student = function(firstName, lastName, subject){
  // call the parent constructor
  Person.call(this, firstName, lastName);

  // initialize our student specific properties
  this.subject = subject;
}

// create a Student.protype object that inherits from Person.prototype object
Student.prototype = Object.create(Person.prototype);

// Set constructor property to refer to Student
Student.prototype.constructor = Student;

Student.prototype.sayHello = function(){
  console.log("Hello, I'm " + this.firstName + ". I'm studying " + this.subject + ".");
}

Student.prototype.sayGoodBye = function(){
  console.log("Goodbye!");
};


// Employee inherits Person
var Employee = function(firstName,lastName, title){
  Person.call(this, firstName, lastName);
  this.title = title
}

Employee.prototype = Object.create(Person.prototype);
Employee.prototype.constructor = Employee;

Employee.prototype.sayHello = function(){
  if (this.canTalk)
    console.log("Hello I'm " + this.firstName + ", the " + this.title)
}

// Customer inherits Person
var Customer = function(firstName, lastName){
  Person.call(this, firstName, lastName);
}

Customer.prototype = Object.create(Person.prototype);
Customer.prototype.constructor = Customer;

// Mime inherits Person
var Mime = function(firstName, lastName){
  Person.call(this, firstName, lastName);
  this.canTalk = false;
}

Mime.prototype = Object.create(Person.prototype);
Mime.prototype.constructor = Mime;


var student1 = new Student("Janet", "Applied Physics");
var em1 = new Employee("Mark", "Software Engineer");
var c1 = new Customer('Joe');
var mime = new Mime('Mime');


// student1.sayHello();
// student1.sayGoodBye();

// em1.sayHello();
// c1.sayHello();
// mime.sayHello();

// console.log(student1 instanceof Person);
// console.log(student1 instanceof Student);
// console.log(em1 instanceof Person);
// console.log(em1 instanceof Employee);
// console.log(c1 instanceof Person);
// console.log(c1 instanceof Customer);
// console.log(mime instanceof Person);
// console.log(mime instanceof Mime);





