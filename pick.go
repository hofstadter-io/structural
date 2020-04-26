package structural

import (
	"fmt"
	"reflect"

	"cuelang.org/go/cue"
)

func Pick(orig, pick interface{}) (interface{}, error) {

	O, ook := orig.(cue.Value)
	P, pok := pick.(cue.Value)

	if ook && pok {
		return PickCue(O, P)
	}

	if !(ook || pok) {
		return PickGo(orig, pick)
	}

	return nil, fmt.Errorf("structural.Pick - Incompatible types %v and %v", reflect.TypeOf(orig), reflect.TypeOf(pick))
}

func PickCue(orig, pick cue.Value) (cue.Value, error) {
	fmt.Println("PickCue - no implemented")
	return cue.Value{}, nil
}

func PickGo(orig, pick interface{}) (interface{}, error) {
	fmt.Println("PickGo - no implemented")
	return nil, nil
}
