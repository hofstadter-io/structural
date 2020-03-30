package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

pick: (cuetest.Table & {TestCases: PickCases}).Results

PickCases :: {
	case1: {
		ex: (structural.Pick & {Orig: A, Pick: { b: string }}).Result
		an: {
      b: "b"
		}
	}
	case2: {
		ex: (structural.Pick & {Orig: X, Pick: { b: string, N: {x: string}, l: [1, 1, 3] }}).Result
		an: {
			b: "b"
			N: {
				x: "x"
			}
			l: [1, 3]
		}
	}
	case3: {
		ex: (structural.Pick & {Orig: X, Pick: { b: string, N: {x: string}, l: <3 }}).Result
		an: {
			b: "b"
			N: {
				x: "x"
			}
			l: [1, 2]
		}
	}
}

X:: {
	a: "a"
	b: "b"
	N: {x: "x", y: "y"}
	l: [1, 2, 3, 4, 5]
}
