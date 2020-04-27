package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var hackLong = `dev command`

func HackRun(args []string) (err error) {

	return err
}

var HackCmd = &cobra.Command{

	Use: "hack",

	Hidden: true,

	Short: "dev command",

	Long: hackLong,

	Run: func(cmd *cobra.Command, args []string) {
		var err error

		// Argument Parsing

		err = HackRun(args)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}
