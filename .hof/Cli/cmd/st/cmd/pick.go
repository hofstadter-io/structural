package cmd

import (
	"fmt"
	"os"

	"strings"

	"github.com/spf13/cobra"

	"github.com/hofstadter-io/structural/cmd/st/ga"
)

var pickLong = `extract Cue values with a 'mask'`

func PickRun(args []string) (err error) {

	return err
}

var PickCmd = &cobra.Command{

	Use: "pick",

	Short: "extract Cue values with a 'mask'",

	Long: pickLong,

	PreRun: func(cmd *cobra.Command, args []string) {

		cs := strings.Fields(cmd.CommandPath())
		c := strings.Join(cs[1:], "/")
		ga.SendGaEvent(c, strings.Join(args, "/"), 0)

	},

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
