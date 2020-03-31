package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

patch: (cuetest.Table & {TestCases: PatchCases}).Results

ou: (structural.Patch & {Orig: {a: "a", b: "b", y: "y"}, Diff: {"": {changed: {y: {from: "y", to: "yy"}}, removed: {b: "b"}, added: {z: "z"}}}}).Result

PatchCases :: {
	case1: {
		ex: (structural.Patch & {Orig: {a: "a", b: "b"}, Diff: {"": {removed: {b: "b"}, added: {z: "z"}}}}).Result
		an: {
			a: "a"
			z: "z"
		}
	}
}
