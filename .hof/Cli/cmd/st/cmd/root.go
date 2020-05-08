package cmd

import (
	"strings"

	"github.com/spf13/cobra"

	"github.com/hofstadter-io/structural/cmd/st/ga"
)

var stLong = `st is structural in a cli`

var RootCmd = &cobra.Command{

	Use: "st",

	Short: "st is structural in a cli",

	Long: stLong,

	PreRun: func(cmd *cobra.Command, args []string) {

		ga.SendGaEvent("root", strings.Join(args, "/"), 0)

	},
}

func init() {

	hf := RootCmd.HelpFunc()
	f := func(cmd *cobra.Command, args []string) {
		if RootCmd.Name() == cmd.Name() {
			as := strings.Join(args, "/")
			ga.SendGaEvent("root/help", as, 0)
		}
		hf(cmd, args)
	}
	RootCmd.SetHelpFunc(f)

	cobra.OnInitialize(initConfig)
	RootCmd.AddCommand(DiffCmd)
	RootCmd.AddCommand(PatchCmd)
	RootCmd.AddCommand(MergeCmd)
	RootCmd.AddCommand(MaskCmd)
	RootCmd.AddCommand(PickCmd)
	RootCmd.AddCommand(QueryCmd)
	RootCmd.AddCommand(HackCmd)
}

func initConfig() {

}
