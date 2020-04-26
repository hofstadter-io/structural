package structural

import (
	"fmt"
	"reflect"

	"cuelang.org/go/cue"
)

func Merge(orig, last interface{}) (interface{}, error) {

	O, ook := orig.(cue.Value)
	L, lok := last.(cue.Value)

	if ook && lok {
		return MergeCue(O, L)
	}

	if !(ook || lok) {
		return MergeGo(orig, last)
	}

	return nil, fmt.Errorf("structural.Merge - Incompatible types %v and %v", reflect.TypeOf(orig), reflect.TypeOf(last))
}

func MergeCue(orig, last cue.Value) (cue.Value, error) {
	fmt.Println("MergeCue - no implemented")
	return cue.Value{}, nil
}

func MergeGo(orig, last interface{}) (interface{}, error) {
	fmt.Println("MergeGo - no implemented")
	return nil, nil
}
