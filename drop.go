package structural

import (
	"fmt"
	"reflect"

	"cuelang.org/go/cue"
)

func Drop(orig, drop interface{}) (interface{}, error) {

	O, ook := orig.(cue.Value)
	D, dok := drop.(cue.Value)

	if ook && dok {
		return DropCue(O, D)
	}

	if !(ook || dok) {
		return DropGo(orig, drop)
	}

	return nil, fmt.Errorf("structural.Drop - Incompatible types %v and %v", reflect.TypeOf(orig), reflect.TypeOf(drop))
}

func DropCue(orig, drop cue.Value) (cue.Value, error) {
	fmt.Println("DropCue - no implemented")
	return cue.Value{}, nil
}

func DropGo(orig, drop interface{}) (interface{}, error) {
	fmt.Println("DropGo - no implemented")
	return nil, nil
}
