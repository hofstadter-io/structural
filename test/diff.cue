package test

import (
  "github.com/hofstadter-io/cuetest"

  "github.com/hofstadter-io/structural"
)

T :: {
  a?: string
  b?: string

  N?: {
    x?: string
    y?: string
    ...
  }
  ...
}

A :: T & {
  a: "a"
  b: "b"
  N: { x: "x", y: "y" }
}
B :: T & {
  b: "b"
  c: "c"
  N: { x: "x", z: "z" }
}
C :: T & {
  b: "b"
  c: "c"
}

Cases :: {
  case1: {
    ex: (structural.Diff & { Orig: A, New: B }).Result
    an: {
        a: "key-removed"
        N: {
            y: "key-removed"
            z: "key-added"
        }
        c: "key-added"
    }
  }
  case2: {
    ex: (structural.Diff & { Orig: B, New: A }).Result
    an: {
        a: "key-added"
        N: {
            y: "key-added"
            z: "key-removed"
        }
        c: "key-removed"
    }
  }
  case3: {
    ex: (structural.Diff & { Orig: A, New: C }).Result
    an: {
        a: "key-removed"
        N: "key-removed"
        c: "key-added"
    }
  }
  case4: {
    ex: (structural.Diff & { Orig: C, New: A }).Result
    an: {
        a: "key-added"
        N: "key-added"
        c: "key-removed"
    }
  }
  case5: {
    ex: (structural.Diff & { Orig: B, New: C }).Result
    an: {
        N: "key-removed"
    }
  }
  case6: {
    ex: (structural.Diff & { Orig: C, New: B }).Result
    an: {
        N: "key-added"
    }
  }
}

diff_tests: (cuetest.Table & { TestCases: Cases }).Results

