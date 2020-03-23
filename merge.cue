package structural

Merge :: {
	Orig: _
	New:  _
	Result: {

		// Loop over keys in orig
		for k, v in Orig {

			// If they not are the same value, so overwrite
			if (New[k] & Orig[k]) == _|_ {

        // The key is missing in new, so add
        if New[k] == _|_ {
          "\(k)": Orig[k]
        }
        // The key is present in new, so overwrite
        if New[k] != _|_ {
          "\(k)": New[k]
        }
			}

			// "Else" if they are the same type
			if (New[k] & Orig[k]) != _|_ {

				// check if values are builtins
				if ((New[k] & Builtin) != _|_) {
					// since builtins, we don't need to compare, take the new value always
          "\(k)": New[k]
				}

				// The values are not builtin, so recurse
				if (New[k] & Builtin) == _|_ {
					NewV = New[k]
					"\(k)": (Merge & {Orig: v, New: NewV}).Result
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

a: {
	foo: "a"
}

b: {
	goo: "b"
}

c: (Merge & {Orig: a, New: b}).Result
