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

command: test: {
	// TODO ls test dir? maybe we prefer to have the list upfront
	task: tests: exec.Run & {
		cmd: ["sh", "-c", "cue export test/*"]
		stdout: string
	}
	task: results: cli.Print & {
		text: task.tests.stdout
	}
}
