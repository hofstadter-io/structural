package cmd

import (
	"fmt"
	"os"

	"strings"

	"github.com/spf13/cobra"

	"github.com/hofstadter-io/structural/cmd/st/ga"
)

var diffLong = `diff two Cue values to create a diffset`

func DiffRun(args []string) (err error) {

	return err
}

var DiffCmd = &cobra.Command{

	Use: "diff",

	Short: "diff two Cue values to create a diffset",

	Long: diffLong,

	PreRun: func(cmd *cobra.Command, args []string) {

		cs := strings.Fields(cmd.CommandPath())
		c := strings.Join(cs[1:], "/")
		ga.SendGaEvent(c, strings.Join(args, "/"), 0)

	},

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
