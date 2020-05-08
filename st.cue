package structural

import (
	"github.com/hofstadter-io/hofmod-cli/gen"
	"github.com/hofstadter-io/hofmod-cli/schema"
)

HofGenCli: gen.#HofGenerator & {
  Outdir: "./"
	Cli: #CLI
}

Outdir: "./"
#Module: "github.com/hofstadter-io/structural"

#_CmdImports: [
	{Path: #Module, ...},
]

#CLI: schema.#Cli & {
	Name:    "st"
	Package: "github.com/hofstadter-io/structural/cmd/st"

	Usage: "st"
	Short: "st is structural in a cli"
	Long: Short

	Releases: schema.#GoReleaser & {
    Disabled: false
    Draft: false
    Author:   "Tony Worm"
    Homepage: "https://github.com/hofstadter-io/structural"

    GitHub: {
      Owner: "hofstadter-io"
      Repo:  "st"
    }

    Docker: {
      Maintainer: "Hofstadter, Inc <open-source@hofstadter.io>"
      Repo: "hofstadter"
    }
	}

  Telemetry: "UA-103579574-5"

	OmitRun: true

	Commands: [
		schema.#Command & {
			Name:   "diff"
			Usage:  "diff"
			Short:  "diff two Cue values to create a diffset"
			Long:   Short
		},

		schema.#Command & {
			Name:   "patch"
			Usage:  "patch"
			Short:  "patch a Cue value with a diffset"
			Long:   Short
		},

		schema.#Command & {
			Name:   "merge"
			Usage:  "merge"
			Short:  "merge two Cue values"
			Long:   Short
		},

		schema.#Command & {
			Name:   "mask"
			Usage:  "mask"
			Short:  "extract Cue values with a 'mask'"
			Long:   Short
		},

		schema.#Command & {
			Name:   "pick"
			Usage:  "pick"
			Short:  "extract Cue values with a 'mask'"
			Long:   Short
		},

		schema.#Command & {
			Name:   "query"
			Usage:  "query"
			Short:  "query from Cue values with masks and attributes"
			Long:   Short
		},

		schema.#Command & {
			Name:   "hack"
			Usage:  "hack"
			Short:  "dev command"
			Long:   Short
			Hidden: true
		},

	]

}

