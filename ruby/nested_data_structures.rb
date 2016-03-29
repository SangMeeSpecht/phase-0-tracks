chicago_hoods = {
	streeterville: {
		walk_score: 98, 
		rent: "$$$/$$$",
		restaurants: [
			"Signature Lounge",
			"DiSotto Enoteca",
			"The Purple Pig"
		], 
		attractions: [
			"John Hancock Center",
			"Water Tower Place",
			"Magnificent Mile"
		]
	},
	south_loop: {
		walk_score: 91, 
		rent: "$$/$$$",
		restaurants: [
			"Eleven City Diner",
			"Umai",
			"Nepal House",
			"Bongo Room"
		], 
		attractions: [
			"Buckingham Fountain",
			"The Field Museum",
			"Shedd Aquarium",
			"Adler Planetarium"
		]
	},
	lakeview: {
		walk_score: 90, 
		rent: "$$/$$$",
		restaurants: [
			"Crisp",
			"BIG & little's Restaurant",
			"Rice'N Bread"
		], 
		attractions: [
			"Belmont Harbor",
			"Blue Man Group",
			"The Vic Theatre"
		]
	},
	chinatown: {
		walk_score: 81, 
		rent: "$/$$$",
		restaurants: [
			"Triple Crown Restuarant",
			"Joy Yee Noodle"
		], 
		attractions: [
			"Pui Tak Center",
			"Chinese American Museum of Chicago"
		]
	},
	hyde_park: {
		walk_score: 84, 
		rent: "$/$$$",
		restaurants: [
			"Medici on 57th",
			"Salonica",
			"Noodles Etc"
		], 
		attractions: [
			"The University of Chicago",
			"Museum of Science and Industry",
			"Oriental Institute Museum"
		]
	},
}

puts chicago_hoods[:streeterville]
puts chicago_hoods[:hyde_park][:walk_score]
puts chicago_hoods[:lakeview][:restaurants]
puts chicago_hoods[:chinatown][:restaurants][0]