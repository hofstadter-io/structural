package structural

import (
	"tool/cli"
	"tool/exec"
)

checks :: ["*.cue"]
command: check: {
	for _, name in checks {
		task: "\(name)-e": exec.Run & {
			cmd: ["sh", "-c", "cue eval ./\(name)"]
			stdout: string
		}
		task: "\(name)-p": cli.Print & {
			text: task["\(name)-e"].stdout
		}
	}
}

tests :: [
	"diff-*",
]

command: test: {
	// TODO ls test dir? maybe we prefer to have the list upfront
	for _, name in tests {
		task: "\(name)-e": exec.Run & {
			cmd: ["sh", "-c", "cue export ./test/\(name).cue"]
			stdout: string
		}
		task: "\(name)-p": cli.Print & {
			text: task["\(name)-e"].stdout
		}
	}
}
