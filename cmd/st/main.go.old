package main

import (
	"fmt"
	"os"

	"github.com/hofstadter-io/structural"
)

const helpMsg = `
st <op> <cuefile> [args...]

<op>: print, diff, merge, patch, pick, drop

[args...]
print: list of paths to print, none means all
`

func main() {
	args := os.Args[1:]

	if len(args) < 2 {
		fmt.Println("Error: invalid args\n", args, "\n", helpMsg)
		os.Exit(1)
	}

	op := args[0]
	file := args[1]
	args = args[2:]

	ops := []string{
		"diff",
		// "drop",
		// "merge",
		// "patch",
		// "pick",
	}

	found := false
	for _, o := range ops {
		if op == o {
			found = true
		}
	}

	if !found {
		fmt.Println("Error: unknown operation ", op)
	}

	err := do(op, file, args)
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(1)
	}
}

func do(op, file string, args []string) error {

	cr := structural.NewCueRuntime()
	errs := cr.LoadCue([]string{file})
	if len(errs) > 0 {
		for _, e := range errs {
			fmt.Println(e)
		}
		os.Exit(1)
	}

	switch op {

	case "print":
		return doPrint(cr, args)

	case "diff":
		return doDiff(cr, args)

	case "merge":
		return doMerge(cr, args)

	case "patch":
		return doPatch(cr, args)

	case "drop":
		return doDrop(cr, args)

	case "pick":
		return doPick(cr, args)

	}

	return nil
}

func doPrint(CR *structural.CueRuntime, args []string) error {
	if len(args) == 0 {
		CR.PrintValue()
		return nil
	}

	return nil
}

func doDiff(CR *structural.CueRuntime, args []string) error {

	return nil
}

func doMerge(CR *structural.CueRuntime, args []string) error {

	return nil
}

func doPatch(CR *structural.CueRuntime, args []string) error {

	return nil
}

func doDrop(CR *structural.CueRuntime, args []string) error {

	return nil
}

func doPick(CR *structural.CueRuntime, args []string) error {

	return nil
}
