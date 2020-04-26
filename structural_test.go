package structural_test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/stretchr/testify/suite"

	"github.com/hofstadter-io/structural"
)

// This test function drives the top level suites for structural
func TestStructuralTestSuite(t *testing.T) {

    suite.Run(t, new(DiffTestSuite))
    suite.Run(t, new(PickTestSuite))

}

func loadCueTestData(entrypoints ...string) *structural.CueRuntime {
	cr := structural.NewCueRuntime()
	errs := cr.LoadCue(entrypoints)
	if len(errs) > 0 {
		for _, e := range errs {
			fmt.Println(e)
		}
		panic("Errors loading cue test data for entrypoints: " + strings.Join(entrypoints, ", "))
	}

	return cr
}
