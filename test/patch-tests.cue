package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

patch: (cuetest.Table & {TestCases: PatchCases}).Results

PatchCases :: {
	case1: {
		ex: (structural.Patch & {Orig: {a: "a", b: "b"}, Diff: {removed: {b: "b"}, added: {z: "z"}}}).Result
		an: {
			a: "a"
			z: "z"
		}
	}
	case2: {
		ex: (structural.Patch & {Orig: {a: "a", b: "b", y: "y", N: {x: "x"}},
														 Diff: {inplace: {N: {changed: {x: {from: "x", to: "xx"}}}}, changed: {y: {from: "y", to: "yy"}}, removed: {b: "b"}, added: {z: "z"}}}).Result
		an: {a: "a", y: "yy", N: {x: "xx"}, z: "z"}
	}
	// Patch(a, Diff(a,b)) == b
	case3: {
		ex: (structural.Patch & {Orig: {a: "a", b: "b", y: "y", N: {x: "x"}},
														 Diff: (structural.Diff & {Orig: {a: "a", b: "b", y: "y", N: {x: "x"}}, New: {a: "a", y: "yy", N: {x: "xx"}, z: "z"}}).Result}).Result
		an: {a: "a", y: "yy", N: {x: "xx"}, z: "z"}
	}
}
