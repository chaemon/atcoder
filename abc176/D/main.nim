# header {{{
when not declared ATCODER_CHAEMON_HEADER_HPP:
  const ATCODER_CHAEMON_HEADER_HPP* = 1
  {.hints:off checks:off warnings:off assertions:on optimization:speed.}
  import std/algorithm as algorithm_lib, std/sequtils as sequtils_lib, std/tables as tables_lib, std/macros as macros_lib, std/math as math_lib, std/sets as sets_lib, std/strutils as strutils_lib, std/strformat as strformat_lib, std/sugar as sugar_lib
  
  import streams
  proc scanf*(formatstr: cstring){.header: "<stdio.h>", varargs.}
  #proc getchar(): char {.header: "<stdio.h>", varargs.}
  proc nextInt*(): int = scanf("%lld",addr result)
  proc nextFloat*(): float = scanf("%lf",addr result)
  proc nextString*[F](f:F): string =
    var get = false
    result = ""
    while true:
  #    let c = getchar()
      let c = f.readChar
      if c.int > ' '.int:
        get = true
        result.add(c)
      elif get: return
  proc nextInt*[F](f:F): int = parseInt(f.nextString)
  proc nextFloat*[F](f:F): float = parseFloat(f.nextString)
  proc nextString*():string = stdin.nextString()
  
  template `max=`*(x,y:typed):void = x = max(x,y)
  template `min=`*(x,y:typed):void = x = min(x,y)
  template inf*(T): untyped = 
    when T is SomeFloat: T(Inf)
    elif T is SomeInteger: ((T(1) shl T(sizeof(T)*8-2)) - (T(1) shl T(sizeof(T)*4-1)))
    else: assert(false)
  
  proc discardableId*[T](x: T): T {.discardable.} =
    return x
  
  macro `:=`*(x, y: untyped): untyped =
    var strBody = ""
    if x.kind == nnkPar:
      for i,xi in x:
        strBody &= fmt"""
{xi.repr} := {y[i].repr}
"""
    else:
      strBody &= fmt"""
when declaredInScope({x.repr}):
  {x.repr} = {y.repr}
else:
  var {x.repr} = {y.repr}
"""
    strBody &= fmt"discardableId({x.repr})"
    parseStmt(strBody)
  
  
  proc toStr*[T](v:T):string =
    proc `$`[T](v:seq[T]):string =
      v.mapIt($it).join(" ")
    return $v
  
  proc print0*(x: varargs[string, toStr]; sep:string):string{.discardable.} =
    result = ""
    for i,v in x:
      if i != 0: addSep(result, sep = sep)
      add(result, v)
    result.add("\n")
    stdout.write result
  
  var print*:proc(x: varargs[string, toStr])
  print = proc(x: varargs[string, toStr]) =
    discard print0(@x, sep = " ")
  
  template makeSeq*(x:int; init):auto =
    when init is typedesc: newSeq[init](x)
    else: newSeqWith(x, init)
  
  macro Seq*(lens: varargs[int]; init):untyped =
    var a = fmt"{init.repr}"
    for i in countdown(lens.len - 1, 0): a = fmt"makeSeq({lens[i].repr}, {a})"
    parseStmt(fmt"""  
block:
  {a}""")
  
  template makeArray*(x:int; init):auto =
    var v:array[x, init.type]
    when init isnot typedesc:
      for a in v.mitems: a = init
    v
  
  macro Array*(lens: varargs[typed], init):untyped =
    var a = fmt"{init.repr}"
    for i in countdown(lens.len - 1, 0):
      a = fmt"makeArray({lens[i].repr}, {a})"
    parseStmt(fmt"""
block:
  {a}""")
# }}}

include atcoder/extra/header/chaemon_header

let H, W = nextInt()
let Ch, Cw, Dh, Dw = nextInt() - 1
let S = newSeqWith(H, nextString())

let dir:array[4, tuple[x,y:int]] = [(0,1),(1,0),(0,-1),(-1,0)]

import atcoder/extra/graph/dijkstra_multi_dimensional

type GraphIterative[P, Weight] = object
  discard
#  dim:P

var t:array = [3, 4, 5]

type P = (int,int)
#var g = GraphIterative[P, int](dim:(H, W))
var g = GraphIterative[P, int]()

iterator adj(g:g.type, d:int, p:P):(int, P) =
  let (x, y) = p
  for di in 0..<4:
    let (x, y) = (x + dir[di].x, y + dir[di].y)
    if x notin 0..<H or y notin 0..<W or S[x][y] == '#': continue
    yield (d, (x, y))
  for i in -2..2:
    for j in -2..2:
      let (x, y) = (x + i, y + j)
      if x notin 0..<H or y notin 0..<W or S[x][y] == '#': continue
      yield (d + 1, (x, y))

block:
  let dist = g.dijkstra((Ch, Cw))
#  let d = dist[Dh][Dw]
  if (Dh, Dw) notin dist:
    print -1;break
  let d = dist[(Dh, Dw)]
  if d == int.inf:
    print -1
  else:
    print d
