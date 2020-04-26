package structural

import (
	"fmt"
	"reflect"

	"cuelang.org/go/cue"
)

func Mask(orig, mask interface{}) (interface{}, error) {

	O, ook := orig.(cue.Value)
	M, mok := mask.(cue.Value)

	if ook && mok {
		return MaskCue(O, M)
	}

	if !(ook || mok) {
		return MaskGo(orig, mask)
	}

	return nil, fmt.Errorf("structural.Mask - Incompatible types %v and %v", reflect.TypeOf(orig), reflect.TypeOf(mask))
}

func MaskCue(orig, mask cue.Value) (cue.Value, error) {
	fmt.Println("MaskCue - no implemented")
	return cue.Value{}, nil
}

func MaskGo(orig, mask interface{}) (interface{}, error) {
	fmt.Println("MaskGo - no implemented")
	return nil, nil
}
