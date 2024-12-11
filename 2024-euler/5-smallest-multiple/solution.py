#!/bin/python3

import sys

def all_multiples(candidate, n):
    for i in range(2, n + 1):
        if candidate % i != 0:
           return False
    return True

def smallest_multiple(n, increment):
    smallest = increment
    for i in range(1, n + 1):
        if all_multiples(smallest, n):
            break

        smallest = i * increment

    return smallest

t = int(input().strip())
for a0 in range(t):
    n = int(input().strip())

    answer = 1
    for i in range(1, n + 1):
        answer = smallest_multiple(i, answer)

    print(answer)