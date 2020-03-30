package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

mask: (cuetest.Table & {TestCases: MaskCases}).Results

MaskCases :: {
	case1: {
		ex: (structural.Mask & {Orig: A, Mask: { b: string }}).Result
		an: {
      a: "a"
			N: {x: "x", y: "y"}
		}
	}
	case2: {
		ex: (structural.Mask & {Orig: X, Mask: { b: string, N: {x: string}, l: [1, 1, 3] }}).Result
		an: {
			a: "a"
			N: {
				y: "y"
			}
			l: [2, 4, 5]
		}
	}
	case3: {
		ex: (structural.Mask & {Orig: X, Mask: { b: string, N: {x: string}, l: <3 }}).Result
		an: {
			a: "a"
			N: {
				y: "y"
			}
			l: [3, 4, 5]
		}
	}
}

X:: {
	a: "a"
	b: "b"
	N: {x: "x", y: "y"}
	l: [1, 2, 3, 4, 5]
}
