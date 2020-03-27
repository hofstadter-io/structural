package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

// Test Results
filterfalse: (cuetest.Table & {TestCases: FilterFalseCases}).Results

FilterFalseCases :: {
	case1: {
		ex: (structural.FilterFalse & { In: [1, 2, 3, 4, 5], F: { In: <3 } }).Result
		an: [3, 4, 5]
	}
	case2: {
		ex: (structural.FilterFalse & { In: [1, 2, "hi", 3, "ok", 4, 5], F: { In: int } }).Result
		an: ["hi", "ok"]
	}
}
