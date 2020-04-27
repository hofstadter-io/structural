package cmd

import (
	"github.com/spf13/cobra"
)

var stLong = `st is structural in a cli`

var RootCmd = &cobra.Command{

	Use: "st",

	Short: "st is structural in a cli",

	Long: stLong,
}

func init() {
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
