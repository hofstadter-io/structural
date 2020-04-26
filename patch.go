package structural

import (
	"fmt"
	"reflect"

	"cuelang.org/go/cue"
)

func Patch(orig, patch interface{}) (interface{}, error) {

	O, ook := orig.(cue.Value)
	P, pok := patch.(cue.Value)

	if ook && pok {
		return PatchCue(O, P)
	}

	if !(ook || pok) {
		return PatchGo(orig, patch)
	}

	return nil, fmt.Errorf("structural.Patch - Incompatible types %v and %v", reflect.TypeOf(orig), reflect.TypeOf(patch))
}

func PatchCue(orig, patch cue.Value) (cue.Value, error) {
	fmt.Println("PatchCue - no implemented")
	return cue.Value{}, nil
}

func PatchGo(orig, patch interface{}) (interface{}, error) {
	fmt.Println("PatchGo - no implemented")
	return nil, nil
}
