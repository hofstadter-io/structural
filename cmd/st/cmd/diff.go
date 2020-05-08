package cmd

import (
	"fmt"
	"os"
	"strings"

	"github.com/spf13/cobra"

	"github.com/hofstadter-io/structural/cmd/st/ga"

	"github.com/hofstadter-io/structural"
)

var diffLong = `diff two Cue values to create a diffset`

func DiffRun(args []string) (err error) {

	s, err := structural.CueDiff(args[0], args[1])
	if err == nil {
		fmt.Println(s)
	}
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
		if len(args) != 2 {
			fmt.Println("usage: st diff old new")
			return
		}

		err = DiffRun(args)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}
