#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <set>
#include <cassert>

using namespace std;

bool isAbundant(const int a) {
    int sum = 0;
    set<int> divisors{a};
    for (int i = 1; i <= sqrt(a) + 1; i++) {
        if (a % i == 0) {
            if (divisors.find(i) == divisors.end()) {
                divisors.insert(i);
                sum += i;
            }
            if (divisors.find(a / i) == divisors.end()) {
                divisors.insert(a / i);
                sum += a / i;
            }
        }
    }
    if (sum > a) return true;
    return false;
}


bool canExpress(int n) {
    if (n > 28123) return true;
    if (n < 24) return false;

    std::set<int> abundant_set;
    for (int i = 12; i <= n; i++) {
        if (isAbundant(i)) abundant_set.insert(i);
    }
    std::set<int> visited;
    for (int a : abundant_set) {
        visited.insert(a);
        if (visited.find(n - a) != visited.end()) {
            // cout << a << " + " << (n - a) << endl;
            return true;
        }
    }
    return false;
}


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */
    string line;
    getline(cin, line);
    const int t = stoi(line);
    assert(t >= 1 && t <= 100);
    for (int i = 0; i < t; i++) {
        getline(cin, line);
        const int n = stoi(line);
        assert(n >= 0 && t <= 100000);
        if (canExpress(n)) cout << "YES" << endl;
        else cout << "NO" << endl;
    }
    return 0;
}
