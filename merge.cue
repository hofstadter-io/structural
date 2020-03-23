package structural

Merge :: {
	Orig: _
	New:  _
	Result: {
		for k, v in Orig {
			if (New[k] & Orig[k]) == _|_ {
				if ((New[k] & Builtin) != _|_) {
					"\(k)": New[k]
				}
				if ((New[k] & Builtin) == _|_) {
					"\(k)": v
				}
			}
			if (New[k] & Orig[k]) != _|_ {
				if ((New[k] & Builtin) != _|_) {
					if New[k] != Orig[k] {
						"\(k)": New[k]
					}
				}
				if (New[k] & Builtin) == _|_ {
					NewV = New[k]
					"\(k)": (Merge & {Orig: v, New: NewV}).Result
				}
			}
		}
		for k, v in New {
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
