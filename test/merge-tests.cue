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
}
