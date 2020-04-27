package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var patchLong = `patch a Cue value with a diffset`

func PatchRun(args []string) (err error) {

	return err
}

var PatchCmd = &cobra.Command{

	Use: "patch",

	Short: "patch a Cue value with a diffset",

	Long: patchLong,

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
