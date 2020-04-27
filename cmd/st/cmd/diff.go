package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var diffLong = `diff two Cue values to create a diffset`

func DiffRun(args []string) (err error) {

	return err
}

var DiffCmd = &cobra.Command{

	Use: "diff",

	Short: "diff two Cue values to create a diffset",

	Long: diffLong,

	Run: func(cmd *cobra.Command, args []string) {
		var err error

		// Argument Parsing

		err = DiffRun(args)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}
