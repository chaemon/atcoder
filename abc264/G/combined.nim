import macros
macro Please(x): untyped = nnkStmtList.newTree()

Please use Nim-ACL
Please use Nim-ACL
Please use Nim-ACL


static:
  when not defined SecondCompile:
    template getFileName():string = instantiationInfo().filename
    block:
      let (output, ex) = gorgeEx("if [ -e ./atcoder ]; then exit 1; else exit 0; fi")
      doAssert ex == 0, "atcoder directory already exisits"
    discard staticExec("echo \"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\" | base64 -d > atcoder.tar.xz && tar -Jxvf atcoder.tar.xz && rm atcoder.tar.xz")
    let (output, ex) = gorgeEx("nim cpp -d:release -d:SecondCompile --path:./ --opt:speed --multimethods:on --warning[SmallLshouldNotBeUsed]:off --checks:off -o:a.out " & getFileName())
    discard staticExec("rm -rf ./atcoder");doAssert ex == 0, output;quit(0)


const
  DO_CHECK = true
  DEBUG = true
  USE_DEFAULT_TABLE = true

# see https://github.com/zer0-star/Nim-ACL/tree/master/src/atcoder/extra/header/chaemon_header.nim
include atcoder/extra/header/chaemon_header


# see https://github.com/zer0-star/Nim-ACL/tree/master/src/atcoder/extra/graph/graph_template.nim
import atcoder/extra/graph/graph_template

# see https://github.com/zer0-star/Nim-ACL/tree/master/src/atcoder/extra/graph/bellman_ford.nim
import atcoder/extra/graph/bellman_ford


solveProc solve(N:int, T:seq[string], P:seq[int]):
  proc id(a:string):int =
    doAssert a.len == 2
    return (a[0].ord - 'a'.ord) * 26 + (a[1].ord - 'a'.ord)
  var score = initTable[string, int]()
  proc calc_score(s:string):int =
    if s notin score: return 0
    else: return score[s]
  for i in N:
    score[T[i]] = P[i]
  const B = 26 * 26
  var g = initGraph[int](B + 1)
  let s = B
  for x0 in 'a'..'z':
    for x1 in 'a'..'z':
      d := calc_score("" & x0) + calc_score("" & x1) + calc_score(x0 & x1)
      g.addEdge(s, id(x0 & x1), -d)
  for x0 in 'a'..'z':
    for x1 in 'a'..'z':
      let x = x0 & x1
      static:
        doAssert x is string
      let y0 = x1
      for y1 in 'a'..'z':
        let y = y0 & y1
        # x0 x1 = y0 y1
        d := calc_score(x0 & y0 & y1) + calc_score(y0 & y1) + calc_score("" & y1)
        g.addEdge(id(x), id(y), -d)
  var r = g.bellman_ford(s)
  if r.negative_cycle:
    echo "Infinity"
  else:
    ans := -int.inf
    for x in 'a' .. 'z':
      ans.max=calc_score("" & x)
    for x0 in 'a'..'z':
      for x1 in 'a'..'z':
        let xi = id(x0 & x1)
        if r[xi] == int.inf: continue
        ans.max= -r[xi]
    echo ans
  discard

when not defined(DO_TEST):
  var N = nextInt()
  var T = newSeqWith(N, "")
  var P = newSeqWith(N, 0)
  for i in 0..<N:
    T[i] = nextString()
    P[i] = nextInt()
  solve(N, T, P)
else:
  discard
