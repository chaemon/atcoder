import java.io.*;
import java.util.*;

class Main {

    // Generated by 1.1.6 https://github.com/kyuridenamida/atcoder-tools  (tips: You use the default template now. You can remove this line by using your custom template)
    public static void main(String[] args) throws Exception {
        final Scanner sc = new Scanner(System.in);
        long N;
        N = sc.nextLong();
        long M;
        M = sc.nextLong();
        long[] a = new long[(int)(M)];
        long[] b = new long[(int)(M)];
        for(int i = 0 ; i < M ; i++){
                a[i] = sc.nextLong();
                b[i] = sc.nextLong();
        }
        solve(N, M, a, b);
    }

    static void solve(long N, long M, long[] a, long[] b){

    }
}