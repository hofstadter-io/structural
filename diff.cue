package structural

import "encoding/json"

import "list"

Diff :: DiffInfo

DiffInfo :: {
	Orig: _
	New:  _
	Result: {
		for k, v in Orig {
			if (New[k] & Orig[k]) == _|_ {
				if ((New[k] & Builtin) != _|_) {
					"\(k)": "value-changed"
				}
				if ((New[k] & Builtin) == _|_) {
					"\(k)": "key-removed"
				}
			}
			if (New[k] & Orig[k]) != _|_ {
				if ((New[k] & Builtin) != _|_) {
					if New[k] != Orig[k] {
						"\(k)": "value-changed"
					}
				}
				if (New[k] & Builtin) == _|_ {
					NewV = New[k]
					"\(k)": (Diff & {Orig: v, New: NewV}).Result
				}
			}
		}
		for k, v in New {
			if (Orig[k] & New[k]) == _|_ {
				if ((Orig[k] & Builtin) != _|_) {
					"\(k)": "value-changed"
				}
				if ((Orig[k] & Builtin) == _|_) {
					"\(k)": "key-added"
				}
			}
		}
	}
}

DiffDeep :: {
	Orig: _
	New:  _
	Path: [...]
	Result: {...}
	Result: {
		for k, v in Orig {
			"\(json.Marshal(Path))": {...}
			if New[k] == _|_ {
				"\(json.Marshal(Path))": removed: {
					"\(k)": Orig[k]
					...
				}
			}
			if New[k] != _|_ {
				if (New[k] & Builtin) != _|_ {
					if (Orig[k] & Builtin) != _|_ {
						if New[k] != Orig[k] {
							"\(json.Marshal(Path))": changed: {
								"\(k)": {from: Orig[k], to: New[k]}
								...
							}
						}
					}
					if (Orig[k] & Builtin) == _|_ {
						"\(json.Marshal(Path))": changed: {
							"\(k)": {from: Orig[k], to: New[k]}
							...
						}
					}
				}
				if (New[k] & Builtin) == _|_ {
					if (Orig[k] & Builtin) == _|_ {
						if (New[k] & Struct) != _|_ {
							if (Orig[k] & Struct) != _|_ {
								NewV = New[k]
								NewP = Path
								(DiffDeep & {Orig: v, New: NewV, Path: list.FlattenN([NewP, k], 1)}).Result
							}
							if (Orig[k] & Struct) == _|_ {
								"\(json.Marshal(Path))": changed: {
									"\(k)": {from: Orig[k], to: New[k]}
									...
								}
							}
						}
						if (New[k] & List) != _|_ {
							if (Orig[k] & List) != _|_ {
								NewV = New[k]
								NewP = Path
								(DiffDeep & {Orig: v, New: NewV, Path: list.FlattenN([NewP, k], 1)}).Result
							}
							if (Orig[k] & List) == _|_ {
								"\(json.Marshal(Path))": changed: {
									"\(k)": {from: Orig[k], to: New[k]}
									...
								}
							}
						}
					}
					if (Orig[k] & Builtin) != _|_ {
						"\(json.Marshal(Path))": changed: {
							"\(k)": {from: Orig[k], to: New[k]}
							...
						}
					}
				}
			}
		}
		for k, v in New {
			if Orig[k] == _|_ {
				"\(json.Marshal(Path))": added: {
					"\(k)": New[k]
					...
				}
			}
		}
	}
}
