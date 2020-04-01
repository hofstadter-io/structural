package structural

import "list"

Patch :: {
	Orig: _
	Diff: _
	Result: (patch & {orig: Orig, diff: Diff}).result
}

patch :: {
	orig: _
	diff: _

	// TODO add keys to error messages

	path: [...]
	origkeys: [k for k,_ in orig]
	diffkeys: [k for k,_ in diff]
	removedkeys: [k for k,_ in (*diff.removed | [])]
	addedkeys: [k for k,_ in (*diff.added | [])]
	changedkeys: [k for k,_ in (*diff.changed | [])]
	inplacekeys: [k for k,_ in (*diff.inplace | [])]
	result: {...}
	result: {
		// Need to remove some keys
		if diff.removed != _|_ {
			for _,k in removedkeys {
				if orig[k] == _|_ {
					"bad patch: removing something which doesn't exist": _|_
				}
			}
			// Anything not removed goes into the struct,
			// unless it's 'changed' or 'inplace', those are handled later
			skipkeys = changedkeys + inplacekeys
			for k,v in orig {
				if list.Contains(removedkeys, k) == false && list.Contains(skipkeys, k) == false {
					"\(k)": v
				}
			}
		}
		// Don't need to remove some keys
		if diff.removed == _|_ {
			// Since nothing is being removed, add everything into the struct,
			// unless it's 'changed' or 'inplace', those are handled later
			skipkeys = changedkeys + inplacekeys
			for k,v in orig {
				if list.Contains(removedkeys, k) == false && list.Contains(skipkeys, k) == false {
					"\(k)": v
				}
			}
		}
		// Need to add keys
		if diff.added != _|_ {
			for _,k in addedkeys {
				if orig[k] != _|_ {
					"bad patch: adding something which already exists": _|_
				}
			}
			for k,v in diff.added {
				"\(k)": v
			}
		}
		// Need to change keys
		if diff.changed != _|_ {
			for k,v in diff.changed {
				if (v.from & orig[k]) == _|_ {
					"bad patch: changing something with a 'from' which doesn't align": _|_
				}
				if (v.from & orig[k]) != _|_ {
					"\(k)": v.to
				}
			}
		}
		// Recurse
		if diff.inplace != _|_ {
			for k,v in diff.inplace {
				if orig[k] == _|_ {
					"bad patch: changing something which doesn't exist": _|_
				}
				if orig[k] != _|_ {
					"\(k)": (Patch & {Orig: orig[k], Diff: v}).Result
				}
			}
		}
	}
}
