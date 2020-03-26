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
