package structural

pickrec: { orig: _, pick: _, result: (Pick & { Orig: orig, Pick: pick }).Result }
Pick :: {
  Orig: _
  Pick: _
  Result: {
    for k,_ in Pick {
      if (Builtin & Orig[k]) != _|_ && (Pick[k] & Orig[k]) != _|_ {
        "\(k)": Orig[k]
      }
      if (List & Orig[k]) != _|_ && (List & Pick[k]) != _|_ {
        "\(k)": [v for i, v in Orig[k] if (v & Pick[k][i]) != _|_]
      }
      if (List & Orig[k]) != _|_ && (List & Pick[k]) == _|_ {
        "\(k)": [v for i, v in Orig[k] if (v & Pick[k]) != _|_]
      }
      if (Struct & Orig[k]) != _|_ {
        "\(k)": (pickrec & { orig: Orig[k], pick: Pick[k] }).result
      }
    }
  }
}

