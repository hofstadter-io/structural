package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

// Test Results
merge: (cuetest.Table & {TestCases: MergeCases}).Results

MergeCases :: {
	case1: {
		ex: (structural.Merge & {Orig: A, New: B}).Result
		an: {
			a: "a"
			b: "b"
			c: "c"
			N: {
				x: "x"
				y: "y"
				z: "z"
			}
		}
	}
	case2: {
		ex: (structural.Merge & {Orig: {a: {b: {c: {z: "z"}}}}, New: {a: {b: {c: {y: "y"}}}}}).Result
		an: {a: {b: {c: {z: "z", y: "y"}}}}
	}
	case3: {
		ex: ddef
		an: {a: {b: {c: {z: "z", y: "y"}}}}
	}
}

ddef:: (structural.Merge & {Orig: {a: {b: {c: {z: "z"}}}}, New: {a: {b: {c: {y: "y"}}}}}).Result
