package structural_test

import (
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/suite"

	"github.com/hofstadter-io/structural"
)

type CommonTestSuite struct {
	suite.Suite

	commonRT *structural.CueRuntime
}

func (suit *CommonTestSuite) TestPV() {
	pv := structural.NewpvStruct()
	pv.Ensure("ok")
	ok := pv.Get("ok")
	assert.NotNil(suit.T(), ok)

	ok.Set("blah", *structural.NewpvStruct().ToExpr())

	ok = ok.Get("blah")
	assert.NotNil(suit.T(), ok)

	assert.NotNil(suit.T(), pv.Get("ok").Get("blah"))
}
