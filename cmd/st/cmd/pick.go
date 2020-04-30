package cmd

import (
	"fmt"
	"os"

	"github.com/hofstadter-io/structural"
	"github.com/spf13/cobra"
)

var pickLong = `extract Cue values with a 'mask'`

func PickRun(args []string) (err error) {

	s, err := structural.CuePick(args[0], args[1])
	if err == nil {
		fmt.Println(s)
	}
	return err
}

var PickCmd = &cobra.Command{

	Use: "pick",

	Short: "extract Cue values with a 'mask'",

	Long: pickLong,

	Run: func(cmd *cobra.Command, args []string) {
		var err error

		// Argument Parsing

		err = PickRun(args)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}
