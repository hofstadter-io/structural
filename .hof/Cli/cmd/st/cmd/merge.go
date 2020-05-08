package cmd

import (
	"fmt"
	"os"

	"strings"

	"github.com/spf13/cobra"

	"github.com/hofstadter-io/structural/cmd/st/ga"
)

var mergeLong = `merge two Cue values`

func MergeRun(args []string) (err error) {

	return err
}

var MergeCmd = &cobra.Command{

	Use: "merge",

	Short: "merge two Cue values",

	Long: mergeLong,

	PreRun: func(cmd *cobra.Command, args []string) {

		cs := strings.Fields(cmd.CommandPath())
		c := strings.Join(cs[1:], "/")
		ga.SendGaEvent(c, strings.Join(args, "/"), 0)

	},

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
