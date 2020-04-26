package structural

import (
	"fmt"
	"reflect"

	"cuelang.org/go/cue"
)

// TODO, diff3 objects

func Diff(theirs, ours interface{}) (interface{}, error) {

	T, tok := theirs.(cue.Value)
	O, ook := ours.(cue.Value)

	if tok && ook {
		return DiffCue(T, O)
	}

	if !(tok || ook) {
		return DiffGo(theirs, ours)
	}

	return nil, fmt.Errorf("structural.Diff - Incompatible types %v and %v", reflect.TypeOf(theirs), reflect.TypeOf(ours))
}

func DiffCue(theirs, ours cue.Value) (cue.Value, error) {
	fmt.Println("DiffCue - no implemented")
	return cue.Value{}, nil
}

func DiffGo(theirs, ours interface{}) (interface{}, error) {
	fmt.Println("DiffGo - no implemented")
	return nil, nil
}
