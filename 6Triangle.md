```
        // Triangle
        width = 6
        height = 6
        grid = [
             "••e•••",
            "••pp••",
             "•ppp••",
            "•pppp•",
             "ppppp•",
            "pppppp",
        ].reversed().convertTo()
```

```
0 1
1 2
2 8
3 43
4 232
5 1038
6 3752
7 10540
8 23466
9 41627
10 57275
11 59443
12 46385
13 27956
14 13288
15 5032
16 1514
17 329
18 49
19 7
[[PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty], [PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.peg, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall]]
[((1, 3), (2, 5)), ((2, 1), (1, 3)), ((4, 1), (2, 1)), ((3, 3), (4, 1)), ((5, 0), (4, 2)), ((4, 2), (2, 2)), ((2, 0), (3, 2)), ((4, 0), (2, 0)), ((1, 0), (3, 0)), ((1, 2), (2, 4)), ((2, 3), (3, 1)), ((2, 5), (1, 3)), ((0, 0), (1, 2)), ((1, 3), (2, 1)), ((3, 0), (2, 2)), ((1, 2), (3, 2)), ((3, 1), (2, 3)), ((3, 4), (2, 2)), ((1, 1), (2, 3))]
[[PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty], [PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.peg, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall]]
[((3, 3), (2, 5)), ((4, 1), (3, 3)), ((2, 2), (4, 2)), ((3, 0), (2, 2)), ((1, 2), (3, 2)), ((0, 0), (1, 2)), ((1, 3), (0, 1)), ((4, 2), (3, 4)), ((2, 5), (3, 3)), ((3, 3), (1, 3)), ((5, 0), (3, 0)), ((2, 4), (1, 2)), ((3, 0), (4, 2)), ((0, 1), (1, 3)), ((4, 2), (2, 2)), ((1, 3), (2, 1)), ((1, 1), (3, 1)), ((1, 0), (3, 0)), ((3, 0), (4, 2))]
[[PegSolitaire.PegType.empty, PegSolitaire.PegType.peg, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty], [PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall]]
[((1, 3), (2, 5)), ((2, 1), (1, 3)), ((4, 1), (2, 1)), ((3, 3), (4, 1)), ((5, 0), (4, 2)), ((4, 2), (2, 2)), ((2, 0), (3, 2)), ((4, 0), (2, 0)), ((1, 0), (3, 0)), ((1, 2), (2, 4)), ((2, 3), (3, 1)), ((2, 5), (1, 3)), ((0, 0), (1, 2)), ((1, 3), (2, 1)), ((3, 0), (2, 2)), ((1, 2), (3, 2)), ((3, 1), (2, 3)), ((3, 4), (2, 2)), ((2, 2), (1, 0))]
[[PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.peg, PegSolitaire.PegType.empty], [PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall]]
[((3, 3), (2, 5)), ((2, 1), (3, 3)), ((4, 2), (3, 4)), ((1, 2), (3, 2)), ((2, 5), (3, 3)), ((3, 3), (2, 1)), ((2, 0), (3, 2)), ((0, 0), (2, 0)), ((3, 0), (1, 0)), ((5, 0), (3, 0)), ((2, 4), (1, 2)), ((1, 2), (0, 0)), ((0, 0), (2, 0)), ((3, 0), (1, 0)), ((1, 0), (2, 2)), ((2, 3), (1, 1)), ((4, 1), (2, 1)), ((1, 1), (3, 1)), ((3, 2), (4, 0))]
[[PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty], [PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.peg, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall]]
[((1, 3), (2, 5)), ((3, 2), (2, 4)), ((1, 2), (3, 2)), ((3, 0), (2, 2)), ((3, 3), (2, 1)), ((0, 0), (1, 2)), ((1, 2), (3, 2)), ((4, 2), (2, 2)), ((2, 5), (1, 3)), ((5, 0), (4, 2)), ((1, 1), (2, 3)), ((1, 0), (3, 0)), ((4, 0), (3, 2)), ((3, 0), (2, 2)), ((1, 3), (2, 1)), ((4, 2), (2, 2)), ((2, 1), (1, 3)), ((1, 3), (3, 3)), ((3, 3), (2, 5))]
[[PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty], [PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.peg, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall]]
[((1, 3), (2, 5)), ((3, 2), (2, 4)), ((1, 2), (3, 2)), ((3, 0), (2, 2)), ((3, 3), (2, 1)), ((0, 0), (1, 2)), ((1, 2), (3, 2)), ((4, 2), (2, 2)), ((2, 5), (1, 3)), ((5, 0), (4, 2)), ((1, 1), (2, 3)), ((1, 0), (3, 0)), ((4, 0), (3, 2)), ((3, 0), (2, 2)), ((1, 3), (2, 1)), ((4, 2), (2, 2)), ((2, 1), (1, 3)), ((3, 4), (2, 2)), ((1, 3), (2, 1))]
[[PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty], [PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.peg, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall], [PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.empty, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall, PegSolitaire.PegType.trueWall]]
[((3, 3), (2, 5)), ((2, 1), (3, 3)), ((4, 2), (3, 4)), ((1, 2), (3, 2)), ((2, 5), (3, 3)), ((3, 3), (2, 1)), ((2, 0), (3, 2)), ((0, 0), (2, 0)), ((3, 0), (1, 0)), ((5, 0), (3, 0)), ((2, 4), (1, 2)), ((1, 2), (0, 0)), ((0, 0), (2, 0)), ((3, 0), (1, 0)), ((1, 0), (2, 2)), ((2, 3), (1, 1)), ((4, 1), (2, 1)), ((3, 2), (2, 0)), ((2, 0), (1, 2))]
20 0
Program ended with exit code: 0
```
