//
//  PegSolitaire.swift
//  PegSolitaire
//
//  Created by Jonathan Pappas on 12/16/21.
//

typealias GroupType = Set<PegSolitaire>

extension GroupType {
    func tree() -> Self {
        var total: Self = []
        for i in self {
            total = total.union(i.allPossibleMoves())
        }
        return total
    }
}

struct PegSolitaire: Hashable {
    var width: Int = 4
    var height: Int = 4
    var grid: [[Bool]]
    
    func hash(into hasher: inout Hasher) { hasher.combine(grid) }
    static func ==(lhs: Self, rhs: Self) -> Bool { lhs.grid == rhs.grid }
    var moveHistory: [((Int, Int), (Int, Int))] = []
    func players() -> Int {
        return grid.reduce(0) { i, j in i + j.filter({ $0 }).count }
    }
    
    init() {
        grid = .init(repeating: .init(repeating: true, count: height), count: width)
        grid[0][1] = false
    }
    
    func allSolutions() {
        var start: GroupType = [self]
        print(0, start.count)
        var moves = 1
        
        while !start.isEmpty {
            start = start.tree()
            print(moves, start.count)
            
            if let s = start.first, s.players() == 1 {
                for i in start {
                    print(i.grid)
                    print(i.moveHistory)
                }
            }
            
            moves += 1
        }
    }
    
    func allPossibleMoves() -> GroupType {
        var total: GroupType = []
        
        for x in 0..<width {
            for y in 0..<height {
                let directions = [(1,0),(-1,0), (0,1), (0,-1)]
                for (dx, dy) in directions {
                    if validHop(x: x, y: y, dx: dx, dy: dy) {
                        var copy = self
                        copy.grid[x][y] = false
                        copy.grid[x + dx][y + dy] = false
                        copy.grid[x + dx + dx][y + dy + dy] = true
                        copy.moveHistory.append(((x, y), (x + dx + dx, y + dy + dy)))
                        total.insert(copy)
                    }
                }
            }
        }
        
        return total
    }
    
    func validHop(x: Int, y: Int, dx: Int, dy: Int) -> Bool {
        // Attempting to select an empty space
        if !grid[x][y] { return false }
        
        // Attempting to hop off board
        let newX = x + dx + dx
        let newY = y + dy + dy
        if newX < 0 || newX >= width || newY < 0 || newY >= height { return false }
        
        // Attempting to hop over an empty space
        if !grid[x + dx][y + dy] { return false }
        
        // Attempting to hop onto a reserved space
        if grid[newX][newY] { return false }
        
        return true
    }
    
}
