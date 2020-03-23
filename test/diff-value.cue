package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

// Test Results
diff: deep: (cuetest.Table & {TestCases: DiffDeepCases}).Results

DiffDeepCases :: {
	case1: {
		ex: (structural.DiffDeep & {Orig: A, New: B}).Result
		an: {
			"[]": {
				removed: {
					a: "a"
				}
				added: {
					c: "c"
				}
			}
			"[\"N\"]": {
				removed: {
					y: "y"
				}
				added: {
					z: "z"
				}
			}
		}
	}
	case2: {
		ex: (structural.DiffDeep & {Orig: A, New: C}).Result
		an: {
			"[]": {
				removed: {
					a: "a"
					N: {
						x: "x"
						y: "y"
					}
				}
				added: {
					c: "c"
				}
			}
		}
	}
}
