package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

// Test Results
diff: info: (cuetest.Table & {TestCases: DiffInfoCases}).Results

// Test Cases
DiffInfoCases :: {
	case1: {
		ex: (structural.DiffInfo & {Orig: A, New: B}).Result
		an: {
			a: "key-removed"
			N: {
				y: "key-removed"
				z: "key-added"
			}
			c: "key-added"
		}
	}
	case2: {
		ex: (structural.DiffInfo & {Orig: B, New: A}).Result
		an: {
			a: "key-added"
			N: {
				y: "key-added"
				z: "key-removed"
			}
			c: "key-removed"
		}
	}
	case3: {
		ex: (structural.DiffInfo & {Orig: A, New: C}).Result
		an: {
			a: "key-removed"
			N: "key-removed"
			c: "key-added"
		}
	}
	case4: {
		ex: (structural.DiffInfo & {Orig: C, New: A}).Result
		an: {
			a: "key-added"
			N: "key-added"
			c: "key-removed"
		}
	}
	case5: {
		ex: (structural.DiffInfo & {Orig: B, New: C}).Result
		an: {
			N: "key-removed"
		}
	}
	case6: {
		ex: (structural.DiffInfo & {Orig: C, New: B}).Result
		an: {
			N: "key-added"
		}
	}
}
