package structural

Merge :: {
	Orig: _
	New:  _
	Result: {...}
	Result: {

		// Loop over keys in orig
		for k, v in Orig {
			if New[k] == _|_ {
				// The key is missing in new, so add
				"\(k)": Orig[k]
			}
			if New[k] != _|_ {
				// If different type, fail
				if (Orig[k] & Builtin) != _|_ && (New[k] & Builtin) == _|_ {
					"bad merge": _|_
				}
				if (Orig[k] & Struct) != _|_ && (New[k] & Struct) == _|_ {
					"bad merge": _|_
				}
				// Always use new for builtins
				if (Orig[k] & Builtin) != _|_ {
					"\(k)": New[k]
				}
				// Recurse for structs
				if (Orig[k] & Struct) != _|_ {
					_orig = Orig[k]
					_new = New[k]
					"\(k)": (Merge & {Orig: _orig, New: _new}).Result
				}
			}
		}

		// add any new keys not in orig to the result
		for k, v in New {
      // add anyting not in orig
      if Orig[k] == _|_ {
        "\(k)": New[k]
      }
		}
	}
}
