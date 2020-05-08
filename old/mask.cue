package structural

maskrec :: { orig: _, mask: _, result: (Mask & { Orig: orig, Mask: mask }).Result }
Mask :: {
  Orig: _
  Mask: _
  Result: {
    for k,_ in Orig {
      if (Builtin & Orig[k]) != _|_ && (Mask[k] & Orig[k]) == _|_ {
        "\(k)": Orig[k]
      }
      if (List & Orig[k]) != _|_ && (List & Mask[k]) != _|_ {
        "\(k)": [v for i, v in Orig[k] if (v & Mask[k][i]) == _|_]
      }
      if (List & Orig[k]) != _|_ && (List & Mask[k]) == _|_ {
        "\(k)": [v for i, v in Orig[k] if (v & Mask[k]) == _|_]
      }
      if (Struct & Orig[k]) != _|_ {
        "\(k)": (maskrec & { orig: Orig[k], mask: Mask[k] }).result
      }
    }
  }
}
