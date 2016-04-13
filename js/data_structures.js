// ---------------------release 1 --------------------
var color = ["green", "blue", "yellow", "orange"];
var name = ["Ed", "George", "Peggy", "Tim"];
console.log(name[0]);
color.push("purple");
name.push("Lady");
console.log(color);
console.log(name);

// create empty horse object
var horse = {};

// loop through arrays to fill horse object
for (var index = 0; index < color.length; index++) {
  console.log(horse);
  horse[name[index]] = color[index];
}
console.log(horse);

// ---------------------release 2 --------------------
// create a constructor function
function Car(make, model, year) {
  // set up the Javascript version of (Ruby's) instance variables to access object info
  this.make = make;
  this.model = model;
  this.year = year;
  // create functions
  this.drive = function() {console.log("Vroooom!"); };
  this.fillUpGas = function() {console.log("Glug glug glug"); };
  this.putTopDown = function() {console.log("*wind blows through your hair*"); };
  // visual verification for user
  console.log("Car initialization complete");
}

// create some objects using  constructor function
var car1 = new Car("Pontiac", "Grand Am", 1998);
var car2 = new Car("Ford", "Escort", 1987);
var car3 = new Car("Geo", "Prizm", 1995);
var car4 = new Car("Toyota", "Corolla", 1998);
var car5 = new Car("Subaru", "Legacy", 2000);

// test functions
car1.drive();
car2.fillUpGas();
car3.putTopDown();
car4.drive();
car5.fillUpGas();
