import macros
macro Please(x): untyped = nnkStmtList.newTree()

Please use Nim-ACL
Please use Nim-ACL
Please use Nim-ACL


static:
  when not defined SecondCompile:
    # md5sum: b7b57bd78814bfb5536ac30586b07edb  atcoder.tar.xz

    template getFileName():string = instantiationInfo().filename
    let fn = getFileName()
    block:
      let (output, ex) = gorgeEx("if [ -e ./atcoder ]; then exit 1; else exit 0; fi")
      doAssert ex == 0, "atcoder directory already exisits"
    discard staticExec("echo \"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\" | base64 -d > atcoder.tar.xz && tar -Jxvf atcoder.tar.xz")
    let (output, ex) = gorgeEx("nim cpp -d:release -d:SecondCompile -d:danger --path:./ --opt:speed --multimethods:on --warning[SmallLshouldNotBeUsed]:off --checks:off -o:a.out " & fn)
    discard staticExec("rm -rf ./atcoder");doAssert ex == 0, output;quit(0)


when defined SecondCompile:
  const DO_CHECK = false;const DEBUG = false
else:
  const DO_CHECK = true;const DEBUG = true
const
  USE_DEFAULT_TABLE = true

# see https://github.com/zer0-star/Nim-ACL/tree/master/src/atcoder/extra/header/chaemon_header.nim
include atcoder/extra/header/chaemon_header

# see https://github.com/zer0-star/Nim-ACL/tree/master/src/atcoder/segtree.nim
import atcoder/segtree


var K0:int
type S = seq[int]
proc op(a, b:S):S {.inline.} =
  result = a
  for i in K0: result[i] += b[i]
proc e():S {.inline.} = Seq[K0: 0]

const YES = "Yes"
const NO = "No"
solveProc solve(N:int, K:int, A:seq[int], Q:int, l:seq[int], r:seq[int]):
  Pred l
  K0 = K
  var st = initSegTree[S](N, op, e)
  for i in N:
    var a = e()
    a[i mod K] += A[i]
    st[i] = a
  for i in Q:
    var a = st[l[i] ..< r[i]]
    if a.allIt(it == a[0]):
      echo YES
    else:
      echo NO
  discard

when not defined(DO_TEST):
  var N = nextInt()
  var K = nextInt()
  var A = newSeqWith(N, nextInt())
  var Q = nextInt()
  var l = newSeqWith(Q, 0)
  var r = newSeqWith(Q, 0)
  for i in 0..<Q:
    l[i] = nextInt()
    r[i] = nextInt()
  solve(N, K, A, Q, l, r)
else:
  discard
