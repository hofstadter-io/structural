package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var mergeLong = `merge two Cue values`

func MergeRun(args []string) (err error) {

	return err
}

var MergeCmd = &cobra.Command{

	Use: "merge",

	Short: "merge two Cue values",

	Long: mergeLong,

	Run: func(cmd *cobra.Command, args []string) {
		var err error

		// Argument Parsing

		err = MergeRun(args)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}
