package structural

// With '::' was getting weird bugs, so making ':' until can figure out what's wrong
Diff :: {
	// Arguments
	Orig: _
	New:  _

	// Internal fields
	// Make sure result is open
	Result: {...}
	Result: {
		// Loop over keys
		for k, v in Orig {
			// If key is not in new
			if New[k] == _|_ {
				// report the remove key and value
				removed: {
					"\(k)": Orig[k]
					...
				}
			}

			// "Else" key is not in new
			if New[k] != _|_ {

				// If the New value is a builtin
				if (New[k] & Builtin) != _|_ {

					// If the Orig value is a builtin
					if (Orig[k] & Builtin) != _|_ {
						// we can compare
						if New[k] != Orig[k] {
							// and report if changed
							changed: {
								"\(k)": {from: Orig[k], to: New[k]}
							}
						}
					}

					// "Else" orig and new values are not the same type for this key
					if (Orig[k] & Builtin) == _|_ {

						// report the key as changed
						changed: {
							"\(k)": {from: Orig[k], to: New[k]}
							...
						}
						...
					}
				}

				// "Else" check if the new value is not a builtin
				if (New[k] & Builtin) == _|_ {
					// If the orig is not a builtin, so we might have the same types
					if (Orig[k] & Builtin) == _|_ {

						// Check if new and orig are Struct types
						if (New[k] & Struct) != _|_ {
							// If they are the same type, recurse
							if (Orig[k] & Struct) != _|_ {
								NewV = New[k]
								inplace: {
									"\(k)": (Diff & {Orig: v, New: NewV}).Result
									...
								}
								...
							}

							// If they are different types, report
							if (Orig[k] & Struct) == _|_ {
								changed: {
									"\(k)": {from: Orig[k], to: New[k]}
									...
								}
								...
							}
						}

						// Check if new and orig are Struct types
						if (New[k] & List) != _|_ {
							// If they are the same type, recurse
							if (Orig[k] & List) != _|_ {
								NewV = New[k]
								inplace: {
									"\(k)": (Diff & {Orig: v, New: NewV}).Result
									...
								}
								...
							}

							// If they are different types, report
							if (Orig[k] & List) == _|_ {
								changed: {
									"\(k)": {from: Orig[k], to: New[k]}
									...
								}
								...
							}
						}
					}

					// "Else" the orig is a builtin, but new is not, again differing types for this key
					if (Orig[k] & Builtin) != _|_ {
						// report the key as changed
						changed: {
							"\(k)": {from: Orig[k], to: New[k]}
							...
						}
						...
					}
				}
			}
		}

		// Add any keys in new, but not in orig
		for k, v in New {
			if Orig[k] == _|_ {
				// report added key and value
				added: {
					"\(k)": New[k]
					...
				}
			}
		}
	}
}
