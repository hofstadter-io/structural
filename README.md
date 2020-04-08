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

## Merge

```
Merge :: {
	// Arguments
	Orig: {...}
	New:  {...}

	Result: {...}
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

## Pick

```
Pick :: {
	// Arguments
  Orig: {...}
  Pick: {...}

  Result: {...}
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
