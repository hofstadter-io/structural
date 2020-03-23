package structural

Merge :: {
	Orig: _
	New:  _
	Result: {

    // Loop over keys in orig
		for k, v in Orig {

      // If they not are the same type
			if (New[k] & Orig[k]) == _|_ {
        // Check for updated value
				if ((New[k] & Builtin) != _|_) {
					"\(k)": New[k]
				}
        // Values is in orig, but not new
				if ((New[k] & Builtin) == _|_) {
					"\(k)": v
				}
			}

      // "Else" if they are the same type
			if (New[k] & Orig[k]) != _|_ {

        // check if values are builtins
				if ((New[k] & Builtin) != _|_) {
          // if different, take the new value
					if New[k] != Orig[k] {
						"\(k)": New[k]
					}
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
      // TODO, figure out why we need both cases here?
			//   if Orig[k] == _|_ {  // does not seem to work...
			if ((Orig[k] & Builtin) != _|_) {
				"\(k)": New[k]
			}
			if ((Orig[k] & Builtin) == _|_) {
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
