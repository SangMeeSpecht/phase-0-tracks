var color = ["green", "blue", "yellow", "orange"];
var name = ["Ed", "George", "Peggy", "Tim"];

console.log(name[0]);

color.push("purple");
name.push("Lady");

console.log(color);
console.log(name);

var horse = {};

for (var index = 0; index < color.length; index++) {
  horse[name[index]] = color[index];
}

console.log(horse);