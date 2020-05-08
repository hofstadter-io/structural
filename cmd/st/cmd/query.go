package cmd

import (
	"fmt"
	"os"
	"strings"

	"github.com/spf13/cobra"

	"github.com/hofstadter-io/structural/cmd/st/ga"

	"github.com/hofstadter-io/structural"
)

var queryLong = `query from Cue values with masks and attributes`

func QueryRun(args []string) (err error) {

	s, err := structural.CueQuery(args[0], args[1])
	if err == nil {
		fmt.Println(s)
	}
	return err
}

var QueryCmd = &cobra.Command{

	Use: "query",

	Short: "query from Cue values with masks and attributes",

	Long: queryLong,

	PreRun: func(cmd *cobra.Command, args []string) {

		cs := strings.Fields(cmd.CommandPath())
		c := strings.Join(cs[1:], "/")
		ga.SendGaEvent(c, strings.Join(args, "/"), 0)

	},

	Run: func(cmd *cobra.Command, args []string) {
		var err error

		// Argument Parsing

		err = QueryRun(args)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}
