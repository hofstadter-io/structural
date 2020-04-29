package cmd

import (
	"fmt"
	"os"

	"github.com/hofstadter-io/structural"
	"github.com/spf13/cobra"
)

var mergeLong = `merge two Cue values`

func MergeRun(args []string) (err error) {

	s, err := structural.CueMerge(args[0], args[1])
	if err == nil {
		fmt.Println(s)
	}
	return err
}

var MergeCmd = &cobra.Command{

	Use: "merge",

	Short: "merge two Cue values",

	Long: mergeLong,

	Run: func(cmd *cobra.Command, args []string) {
		var err error

		// Argument Parsing
		if len(args) != 2 {
			fmt.Println("usage: st merge old new")
			return
		}

		err = MergeRun(args)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}
