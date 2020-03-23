package test

import (
	"github.com/hofstadter-io/cuetest"

	"github.com/hofstadter-io/structural"
)

// Test Results
diff: (cuetest.Table & {TestCases: DiffCases}).Results

DiffCases :: {
	case1: {
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
	case2: {
		ex: (structural.Diff & {Orig: B, New: A}).Result
		an: {
			"[]": {
				removed: {
					c: "c"
				}
				added: {
					a: "a"
				}
			}
			"[\"N\"]": {
				removed: {
					z: "z"
				}
				added: {
					y: "y"
				}
			}
		}
	}
	case3: {
		ex: (structural.Diff & {Orig: A, New: C}).Result
		an: {
			"[]": {
				removed: {
					a: "a"
					N: {
						x: "x"
						y: "y"
					}
				}
				added: {
					c: "c"
				}
			}
		}
	}
	case4: {
		ex: (structural.Diff & {Orig: C, New: A}).Result
		an: {
			"[]": {
				removed: {
					c: "c"
				}
				added: {
					a: "a"
					N: {
						x: "x"
						y: "y"
					}
				}
			}
		}
	}
	case5: {
		ex: (structural.Diff & {Orig: B, New: C}).Result
		an: {
			"[]": {
				removed: {
					N: {
						x: "x"
						z: "z"
					}
				}
			}
		}
	}
	case6: {
		ex: (structural.Diff & {Orig: C, New: B}).Result
		an: {
			"[]": {
				added: {
					N: {
						x: "x"
						z: "z"
					}
				}
			}
		}
	}
}
