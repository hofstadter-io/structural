# structural

Structural diff, merge, patch helpers for CUE

You will need at least https://cuelang.org installed.

[MVS will make using cue modules easier.](https://github.com/hofstadter-io/mvs)

### Usage

`structural` is most easily used with cue modules,
see https://github.com/hofstadter-io/mvs.

#### Initialize a cue module

```
mvs init cue github.com/<namespace>/<project>
```

#### Add `structural` to your `cue.mods` file:

```
require github.com/hofstadter-io/structural v0.0.2
```

#### Update your dependencies:

```
mvs vendor
```

#### After creating `example.cue` run the following:

```
cue eval example.cue
cue export example.cue
```

Look for a "same" field == true


#### example.cue

```
import "github.com/hofstadter-io/structural"

A :: {
	a: "a"
	b: "b"
	N: {x: "x", y: "y"}
}
B :: {
	b: "b"
	c: "c"
	N: {x: "x", z: "z"}
}

diff: {
  same: (ex & an) != _|_
  ex: (structural.Diff & {Orig: A, New: B}).Result
  an: {
    "[]": {
      removed: {
        a: "a"
      }
      added: {
        c: "c"
      }
    }
    "[\"N\"]": {
      removed: {
        y: "y"
      }
      added: {
        z: "z"
      }
    }
  }
}

merge: {
  same: (ex & an) != _|_
  ex: (structural.Merge & {Orig: A, New: B}).Result
  an: {
    a: "a"
    b: "b"
    c: "c"
    N: {
      x: "x"
      y: "y"
      z: "z"
    }
  }
}
```
