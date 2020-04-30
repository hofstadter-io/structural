package cmd

import (
	"fmt"
	"os"

	"github.com/hofstadter-io/structural"
	"github.com/spf13/cobra"
)

var maskLong = `extract Cue values with a 'mask'`

func MaskRun(args []string) (err error) {

	s, err := structural.CueMask(args[0], args[1])
	if err == nil {
		fmt.Println(s)
	}
	return err
}

var MaskCmd = &cobra.Command{

	Use: "mask",

	Short: "extract Cue values with a 'mask'",

	Long: maskLong,

	Run: func(cmd *cobra.Command, args []string) {
		var err error

		// Argument Parsing

		err = MaskRun(args)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}
