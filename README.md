# structural

Structural
[diff](#Diff),
[merge](#Merge),
[patch](#Patch),
[pick](#Pick),
and
[mask](#Mask) helpers for [CUE](https://cuelang.org).

[MVS will make using cue modules easier.](https://github.com/hofstadter-io/mvs)

## Index

1. [Usage](#Usage)
1. [diff](#Diff)
1. [merge](#Merge)
1. [patch](#Patch)
1. [pick](#Pick)
1. [mask](#Mask)
1. [Developing](#Developing)

## Usage

`structural` is most easily used with cue modules,
see https://github.com/hofstadter-io/mvs.

### Initialize a cue module

```
mvs init cue github.com/<namespace>/<project>
```

### Add `structural` to your `cue.mods` file:

```
require github.com/hofstadter-io/structural v0.0.3
```

### Update your dependencies:

```
mvs vendor
```

### After creating `example.cue` (see below) run the following:

```
cue eval example.cue
cue export example.cue
```

Look for a "same" field == true


### example.cue

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

## Diff

```
Diff :: {
	// Arguments
	Orig: {...}
	New:  {...}

	Result: {...}
}
```

```
A :: {
	a: "a"
	b: "b"
	N: {x: "x", y: "y"}
}
Z :: {
	a: "a"
	b: "b"
	N: "N"
}
x: (structural.Diff & {Orig: A, New: Z}).Result
x: {
	changed: {
	  N: {
	    from: {
	      x: "x"
	      y: "y"
	    }
	    to: "N"
	  }
	}
}
```

## Merge

```
Merge :: {
	// Arguments
	Orig: {...}
	New:  {...}

	Result: {...}
```

```
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
x: (structural.Merge & {Orig: A, New: B}).Result
x: {
  a: "a"
  b: "b"
  c: "c"
  N: {
    x: "x"
    y: "y"
    z: "z"
  }
}
```

## Patch

```
Patch :: {
	// Arguments
	Orig: {...}
	Diff: {...}

	Result: {...}
}
```

```
x: (structural.Patch & {Orig: {a: "a", b: "b", y: "y", N: {x: "x"}},
												 Diff: {inplace: {N: {changed: {x: {from: "x", to: "xx"}}}}, changed: {y: {from: "y", to: "yy"}}, removed: {b: "b"}, added: {z: "z"}}}).Result
x: {a: "a", y: "yy", N: {x: "xx"}, z: "z"}
```

## Pick

```
Pick :: {
	// Arguments
  Orig: {...}
  Pick: {...}

  Result: {...}
}
```

```
X:: {
	a: "a"
	b: "b"
	N: {x: "x", y: "y"}
	l: [1, 2, 3, 4, 5]
}
x: (structural.Pick & {Orig: X, Pick: { b: string, N: {x: string}, l: [1, 1, 3] }}).Result
x: {
  b: "b"
  N: {
    x: "x"
  }
  l: [1, 3]
}
```

## Mask

```
Mask :: {
	// Arguments
  Orig: {...}
  Mask: {...}

  Result: {...}
}
```

```
X:: {
	a: "a"
	b: "b"
	N: {x: "x", y: "y"}
	l: [1, 2, 3, 4, 5]
}
x: (structural.Mask & {Orig: X, Mask: { b: string, N: {x: string}, l: [1, 1, 3] }}).Result
x: {
	a: "a"
	N: {
		y: "y"
	}
	l: [2, 4, 5]
}
```

## Developing

There isn't much special, you just need cue installed.

### Running tests

```
cue test
```

See the [test directory](./test)
for more specifics and examples.

This runs the test command in `test_tool.cue`
which is nothing more than "cue export test/*.cue"
