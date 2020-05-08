package cmd

import (
	"fmt"
	"os"

	"strings"

	"github.com/spf13/cobra"

	"github.com/hofstadter-io/structural/cmd/st/ga"
)

var maskLong = `extract Cue values with a 'mask'`

func MaskRun(args []string) (err error) {

	return err
}

var MaskCmd = &cobra.Command{

	Use: "mask",

	Short: "extract Cue values with a 'mask'",

	Long: maskLong,

	PreRun: func(cmd *cobra.Command, args []string) {

		cs := strings.Fields(cmd.CommandPath())
		c := strings.Join(cs[1:], "/")
		ga.SendGaEvent(c, strings.Join(args, "/"), 0)

	},

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
