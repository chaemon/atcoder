include atcoder/header
import atcoder/lazysegtree

block:
  type S = tuple[zero, one, inversion:int]
  # swapping flag
  type F = bool

  proc op(l, r:S):S =
    (l.zero + r.zero,
     l.one + r.one,
     l.inversion + r.inversion + l.one * r.zero)
  proc e():S = (0,0,0)
  proc mapping(l:F, r:S):S =
      if not l: return r
      return (r.one, r.zero, r.one * r.zero - r.inversion)
  proc composition(l, r:F):F = (l and not r) or (not l and r)
  proc id():F = false
  
  let n, q = nextInt()
  let a:seq[S] = newSeqWith(n, if nextInt() == 0: (1, 0, 0) else: (0, 1, 0))

  var seg = init_lazy_segtree(a, op, e, mapping, composition, id)
  for i in 0..<q:
    var t, l, r = nextInt()
    l.dec
    if t == 1:
      seg.apply(l..<r, true)
    else:
      echo seg.prod(l..<r).inversion
