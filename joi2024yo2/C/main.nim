when defined SecondCompile:
  const DO_CHECK = false;const DEBUG = false
else:
  const DO_CHECK = true;const DEBUG = true
const
  USE_DEFAULT_TABLE = true
  DO_TEST = false


include lib/header/chaemon_header

solveProc solve(N:int, S:string, A:int, B:int, C:int):
  discard

when not defined(DO_TEST):
  var N = nextInt()
  var S = nextString()
  var A = nextInt()
  var B = nextInt()
  var C = nextInt()
  solve(N, S, A, B, C)
else:
  discard
