package cmd

import (
	"fmt"
	"os"

	"strings"

	"github.com/spf13/cobra"

	"github.com/hofstadter-io/structural/cmd/st/ga"
)

var patchLong = `patch a Cue value with a diffset`

func PatchRun(args []string) (err error) {

	return err
}

var PatchCmd = &cobra.Command{

	Use: "patch",

	Short: "patch a Cue value with a diffset",

	Long: patchLong,

	PreRun: func(cmd *cobra.Command, args []string) {

		cs := strings.Fields(cmd.CommandPath())
		c := strings.Join(cs[1:], "/")
		ga.SendGaEvent(c, strings.Join(args, "/"), 0)

	},

	Run: func(cmd *cobra.Command, args []string) {
		var err error

		// Argument Parsing

		err = PatchRun(args)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}
