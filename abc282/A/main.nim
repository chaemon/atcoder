when defined SecondCompile:
  const DO_CHECK = false;const DEBUG = false
else:
  const DO_CHECK = true;const DEBUG = true
const
  USE_DEFAULT_TABLE = true

include lib/header/chaemon_header

solveProc solve(K:int):
  var ans = ""
  for i in K:
    ans.add 'A' + i
  echo ans
  discard

when not defined(DO_TEST):
  var K = nextInt()
  solve(K)
else:
  discard

