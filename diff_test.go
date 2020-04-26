package structural_test

import (
	"github.com/stretchr/testify/suite"
	"github.com/stretchr/testify/assert"

	"github.com/hofstadter-io/structural"
)

type DiffTestSuite struct {
	suite.Suite

	diffRT *structural.CueRuntime
}

func (suite *DiffTestSuite) SetupTest() {
	suite.diffRT = loadCueTestData("testdata/diff.cue")
}

func (suite *DiffTestSuite) TestDiff() {
	assert.True(suite.T(), true, "True is true!")
}
