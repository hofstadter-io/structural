package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

// Test Results
filter: (cuetest.Table & {TestCases: FilterCases}).Results

FilterCases :: {
	case1: {
		ex: (structural.Filter & { In: [1, 2, 3, 4, 5], F: { In: <3 } }).Result
		an: [1, 2]
	}
	case2: {
		ex: (structural.Filter & { In: [1, 2, "hi", 3, "ok", 4, 5], F: { In: int } }).Result
		an: [1, 2, 3, 4, 5]
	}
}
