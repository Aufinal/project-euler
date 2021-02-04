from itertools import permutations, product, combinations

patterns = [
    "({0} {4} {1}) {5} ({2} {6} {3})",
    "(({0} {4} {1}) {5} {2}) {6} {3}",
    "({0} {4} ({1} {5} {2})) {6} {3}",
    "{0} {4} ({1} {5} ({2} {6} {3}))",
    "{0} {4} (({1} {5} {2}) {6} {3})",
]

ops = ["+", "*", "/", "-"]


def parse(p, l, o):
    return eval(p.format(*l, *o))


def targets(l):
    s = set()
    for l1 in permutations(l):
        for o in product(ops, repeat=3):
            for p in patterns:
                try:
                    res = parse(p, l1, o)

                except ZeroDivisionError:
                    continue
                if int(res) == res and res > 0:
                    s.add(int(res))

    return s


def max_consec(s):
    l = sorted(list(s))
    i = 0
    while l[i] == i + 1:
        i += 1

    return i


print(max(combinations(range(1, 10), 4), key=lambda l: max_consec(targets(l))))
