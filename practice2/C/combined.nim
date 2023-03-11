when not declared ATCODER_MATH_HPP:
  const ATCODER_MATH_HPP* = 1

  when not declared ATCODER_INTERNAL_MATH_HPP:
    const ATCODER_INTERNAL_MATH_HPP* = 1
    import std/math
  
    # Fast moduler by barrett reduction
    # Reference: https:#en.wikipedia.org/wiki/Barrett_reduction
    # NOTE: reconsider after Ice Lake
    type Barrett* = object
      m*, im:uint
  
    # @param m `1 <= m`
    proc initBarrett*(m:uint):auto = Barrett(m:m, im:(0'u - 1'u) div m + 1)
  
    # @return m
    proc umod*(self: Barrett):uint =
      self.m
  
    {.emit: """
  inline unsigned long long calc_mul(const unsigned long long &a, const unsigned long long &b){
    return (unsigned long long)(((unsigned __int128)(a)*b) >> 64);
  }
  """.}
    proc calc_mul*(a,b:culonglong):culonglong {.importcpp: "calc_mul(#,#)", nodecl.}
    # @param a `0 <= a < m`
    # @param b `0 <= b < m`
    # @return `a * b % m`
    proc mul*(self: Barrett, a:uint, b:uint):uint =
      # [1] m = 1
      # a = b = im = 0, so okay
  
      # [2] m >= 2
      # im = ceil(2^64 / m)
      # -> im * m = 2^64 + r (0 <= r < m)
      # let z = a*b = c*m + d (0 <= c, d < m)
      # a*b * im = (c*m + d) * im = c*(im*m) + d*im = c*2^64 + c*r + d*im
      # c*r + d*im < m * m + m * im < m * m + 2^64 + m <= 2^64 + m * (m + 1) < 2^64 * 2
      # ((ab * im) >> 64) == c or c + 1
      let z = a * b
      #  #ifdef _MSC_VER
      #      unsigned long long x;
      #      _umul128(z, im, &x);
      #  #else
      ##TODO
      #      unsigned long long x =
      #        (unsigned long long)(((unsigned __int128)(z)*im) >> 64);
      #  #endif
      let x = calc_mul(z.culonglong, self.im.culonglong).uint
      var v = z - x * self.m
      if self.m <= v: v += self.m
      return v
  
    # @param n `0 <= n`
    # @param m `1 <= m`
    # @return `(x ** n) % m`
    proc pow_mod_constexpr*(x,n,m:int):int {.compileTime.} =
      if m == 1: return 0
      var
        r = 1
        y = floorMod(x, m)
        n = n
      while n != 0:
        if (n and 1) != 0: r = (r * y) mod m
        y = (y * y) mod m
        n = n shr 1
      return r.int
    
    # Reference:
    # M. Forisek and J. Jancina,
    # Fast Primality Testing for Integers That Fit into a Machine Word
    # @param n `0 <= n`
    proc is_prime_constexpr*(n:int):bool {.compileTime.} =
      if n <= 1: return false
      if n == 2 or n == 7 or n == 61: return true
      if n mod 2 == 0: return false
      var d = n - 1
      while d mod 2 == 0: d = d div 2
      for a in [2, 7, 61]:
        var
          t = d
          y = pow_mod_constexpr(a, t, n)
        while t != n - 1 and y != 1 and y != n - 1:
          y = y * y mod n
          t =  t shl 1
        if y != n - 1 and t mod 2 == 0:
          return false
      return true
    proc is_prime*[n:static[int]]():bool {.compileTime.} = is_prime_constexpr(n)
  #  
  #  # @param b `1 <= b`
  #  # @return pair(g, x) s.t. g = gcd(a, b), xa = g (mod b), 0 <= x < b/g
    proc inv_gcd*(a, b:int):(int,int) =
      var a = floorMod(a, b)
      if a == 0: return (b, 0)
    
      # Contracts:
      # [1] s - m0 * a = 0 (mod b)
      # [2] t - m1 * a = 0 (mod b)
      # [3] s * |m1| + t * |m0| <= b
      var
        s = b
        t = a
        m0 = 0
        m1 = 1
    
      while t != 0:
        var u = s div t
        s -= t * u;
        m0 -= m1 * u;  # |m1 * u| <= |m1| * s <= b
    
        # [3]:
        # (s - t * u) * |m1| + t * |m0 - m1 * u|
        # <= s * |m1| - t * u * |m1| + t * (|m0| + |m1| * u)
        # = s * |m1| + t * |m0| <= b
    
        var tmp = s
        s = t;t = tmp;
        tmp = m0;m0 = m1;m1 = tmp;
      # by [3]: |m0| <= b/g
      # by g != b: |m0| < b/g
      if m0 < 0: m0 += b div s
      return (s, m0)
  
    # Compile time primitive root
    # @param m must be prime
    # @return primitive root (and minimum in now)
    proc primitive_root_constexpr*(m:int):int {.compileTime.} =
      if m == 2: return 1
      if m == 167772161: return 3
      if m == 469762049: return 3
      if m == 754974721: return 11
      if m == 998244353: return 3
      var divs:array[20, int]
      divs[0] = 2
      var cnt = 1
      var x = (m - 1) div 2
      while x mod 2 == 0: x = x div 2
      var i = 3
      while i * i <= x:
        if x mod i == 0:
          divs[cnt] = i
          cnt.inc
          while x mod i == 0:
            x = x div i
        i += 2
      if x > 1:
        divs[cnt] = x
        cnt.inc
      var g = 2
      while true:
        var ok = true
        for i in 0..<cnt:
          if pow_mod_constexpr(g, (m - 1) div divs[i], m) == 1:
            ok = false
            break
        if ok: return g
        g.inc
    proc primitive_root*[m:static[int]]():auto {.compileTime.} =
      primitive_root_constexpr(m)
    discard
  import std/math
  proc pow_mod*(x,n,m:int):int =
    assert 0 <= n and 1 <= m
    if m == 1: return 0
    let bt = initBarrett(m.uint)
    var
      r = 1.uint
      y = x.floorMod(m).uint
      n = n
    while n != 0:
      if (n and 1) != 0: r = bt.mul(r, y)
      y = bt.mul(y, y)
      n = n shr 1
    return r.int
  
  proc inv_mod*(x, m:int):int =
    assert 1 <= m
    let z = inv_gcd(x, m)
    assert z[0] == 1
    return z[1]
  
  # (rem, mod)
  proc crt*(r, m:seq[int]):(int,int) =
    assert r.len == m.len
    let n = r.len
    # Contracts: 0 <= r0 < m0
    var (r0, m0) = (0, 1)
    for i in 0..<n:
      assert 1 <= m[i]
      var
        r1 = floorMod(r[i], m[i])
        m1 = m[i]
      if m0 < m1:
        swap(r0, r1)
        swap(m0, m1)
      if m0 mod m1 == 0:
        if r0 mod m1 != r1: return (0, 0)
        continue
      #  assume: m0 > m1, lcm(m0, m1) >= 2 * max(m0, m1)
  
      #  (r0, m0), (r1, m1) -> (r2, m2 = lcm(m0, m1));
      #  r2 % m0 = r0
      #  r2 % m1 = r1
      #  -> (r0 + x*m0) % m1 = r1
      #  -> x*u0*g % (u1*g) = (r1 - r0) (u0*g = m0, u1*g = m1)
      #  -> x = (r1 - r0) / g * inv(u0) (mod u1)
  
      #  im = inv(u0) (mod u1) (0 <= im < u1)
      let
        (g, im) = inv_gcd(m0, m1)
        u1 = m1 div g
      # |r1 - r0| < (m0 + m1) <= lcm(m0, m1)
      if ((r1 - r0) mod g) != 0: return (0, 0)
  
      # u1 * u1 <= m1 * m1 / g / g <= m0 * m1 / g = lcm(m0, m1)
      let x = (r1 - r0) div g mod u1 * im mod u1
  
      # |r0| + |m0 * x|
      # < m0 + m0 * (u1 - 1)
      # = m0 + m0 * m1 / g - m0
      # = lcm(m0, m1)
      r0 += x * m0
      m0 *= u1  # -> lcm(m0, m1)
      if r0 < 0: r0 += m0
    return (r0, m0)

  proc floor_sum*(n, m, a, b:int):int =
    var
      ans = 0
      (a, b) = (a, b)
    if a >= m:
      ans += (n - 1) * n * (a div m) div 2
      a = a mod m
    if b >= m:
      ans += n * (b div m)
      b = b mod m
    let
      y_max = (a * n + b) div m
      x_max = y_max * m - b
    if y_max == 0: return ans
    ans += (n - (x_max + a - 1) div a) * y_max
    ans += floor_sum(y_max, a, m, (a - x_max mod a) mod a)
    return ans
  discard
when not declared ATCODER_HEADER_HPP:
  {.hints:off checks:off assertions:on checks:off optimization:speed.}
  const ATCODER_HEADER_HPP = 1
  import std/algorithm
  import std/sequtils
  import std/tables
  import std/macros
  import std/math
  import std/sets
  import std/strutils
  import std/streams
  import std/strformat
  import std/sugar
  
  proc scanf*(formatstr: cstring){.header: "<stdio.h>", varargs.}
  proc getchar*(): char {.header: "<stdio.h>", varargs.}
  proc nextInt*(base:int = 0): int =
    scanf("%lld",addr result)
    result -= base
  proc nextFloat*(): float = scanf("%lf",addr result)
  proc nextString*(): string =
    var get = false;result = ""
    while true:
      var c = getchar()
      if int(c) > int(' '): get = true;result.add(c)
      elif get: break
  template `max=`*(x,y:typed):void = x = max(x,y)
  template `min=`*(x,y:typed):void = x = min(x,y)
  template inf*(T): untyped = 
    when T is SomeFloat: T(Inf)
    elif T is SomeInteger: ((T(1) shl T(sizeof(T)*8-2)) - (T(1) shl T(sizeof(T)*4-1)))
    else: assert(false)
  discard

let t = nextInt()

for i in 0..<t:
  let n, m, a, b = nextInt()
  echo floor_sum(n, m, a, b)

