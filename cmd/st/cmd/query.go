package cmd

import (
	"fmt"
	"os"

	"github.com/hofstadter-io/structural"
	"github.com/spf13/cobra"
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
