package test

// Test object definition
T :: {
	a?: string
	b?: string

	N?: {
		x?: string
		y?: string
		...
	}
	...
}

// Test object values
A :: T & {
	a: "a"
	b: "b"
	N: {x: "x", y: "y"}
}
B :: T & {
	b: "b"
	c: "c"
	N: {x: "x", z: "z"}
}
C :: T & {
	b: "b"
	c: "c"
}
Z :: {
	a: "a"
	b: "b"
	N: "N"
}
