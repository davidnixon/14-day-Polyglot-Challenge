import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
    static long sumMultiples(long n, long k) {
        long m = n / k;
        return k * m * (m + 1) / 2;
    }

    static long sumMultiples(long n) {
        long sum3 = sumMultiples(n - 1, 3);
        long sum5 = sumMultiples(n - 1, 5);
        long sum15 = sumMultiples(n - 1, 15);
        return sum3 + sum5 - sum15;
    }
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int t = in.nextInt();
        for(int a0 = 0; a0 < t; a0++){
            int n = in.nextInt();
            System.out.println(sumMultiples(n));
        }
        in.close();
    }
}
