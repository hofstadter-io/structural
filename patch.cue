package structural

import "list"

Patch :: {
	Orig: _
	Diff: _
	Result: (patch & {orig: Orig, diff: Diff[""]}).result
}

patch :: {
	orig: _
	diff: _

	path: [...]
	origkeys: [k for k,_ in orig]
	diffkeys: [k for k,_ in diff]
	result: {...}
	result: {
		if diff.removed != _|_ {
			removedkeys = [k for k,_ in diff.removed]
			for _,k in removedkeys {
				if orig[k] == _|_ {
					"bad patch: removing something which doesn't exist": _|_
				}
			}
			for k,v in orig {
				if list.Contains(removedkeys, k) == false {
					"\(k)": v
				}
			}
		}
		if diff.removed == _|_ {
			// TODO need to check if a key is in any other paths which are modified
			// if it is then don't just add it here, recursively patch it
			for k,v in orig {
				"\(k)": v
			}
		}
		if diff.added != _|_ {
			addedkeys = [k for k,_ in diff.added]
			for _,k in addedkeys {
				if orig[k] != _|_ {
					"bad patch: adding something which already exists": _|_
				}
			}
			for k,v in diff.added {
				"\(k)": v
			}
		}
		// TODO handle 'changed', and make sure the from unifies with the orig[k]
	}
}
