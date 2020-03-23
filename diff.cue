package structural

Diff :: {
  Orig: _
  New: _
  Result: {
    for k,v in Orig {
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
          "\(k)": (Diff & { Orig: v, New: NewV }).Result
        }
      }
    }
    for k,v in New {
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

