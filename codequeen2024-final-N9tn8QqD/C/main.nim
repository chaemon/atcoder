when defined SecondCompile:
  const DO_CHECK = false;const DEBUG = false
else:
  const DO_CHECK = true;const DEBUG = true
const
  USE_DEFAULT_TABLE = true
  DO_TEST = false


include lib/header/chaemon_header

solveProc solve(N:int, K:int, T:int, P:seq[int]):
  discard

when not defined(DO_TEST):
  var N = nextInt()
  var K = nextInt()
  var T = nextInt()
  var P = newSeqWith(N, nextInt())
  solve(N, K, T, P)
else:
  discard

