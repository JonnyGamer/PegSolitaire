//
//  PegSolitaireHex.swift
//  PegSolitaire
//
//  Created by Jonathan Pappas on 12/16/21.
//

extension Set where Element == PegSolitaireHex {
    func tree(grandTotal: Self) -> Self {
        var total: Self = []
        for i in self {
            total = total.union(i.allPossibleMoves())
        }
        return total.subtracting(grandTotal)
    }
}

struct PegSolitaireHex: Hashable {
    var width: Int = 6
    var height: Int = 6
    var grid: [[PegType]]
    
    func hash(into hasher: inout Hasher) { hasher.combine(grid) }
    static func ==(lhs: Self, rhs: Self) -> Bool { lhs.grid == rhs.grid }
    var moveHistory: [((Int, Int), (Int, Int))] = []
    func players() -> Int {
        return grid.reduce(0) { i, j in i + j.filter({ $0 == .peg }).count }
    }
    
    init() {
        //grid = .init(repeating: .init(repeating: .peg, count: height), count: width)
        
        // Puzzle from PUZZLED
        width = 5
        height = 5
        grid = [
            "•ppp•",
            "•pp••",
            "pp pp",
             "pppp•",
            "•p•p•",
        ].reversed().convertTo()
        
        // Triangle
        width = 5
        height = 5
        grid = [
            "•• ••",
            "•pp••",
            "•ppp•",
             "pppp•",
            "ppppp",
        ].reversed().convertTo()
        
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
        
        
        
        //grid[0][1] = .empty
    }
    
    func allSolutions() {
        var grandTotal: Set<Self> = [self]
        var start: Set<Self> = [self]
        print(0, start.count)
        var moves = 1
        
        var found = false
        while !start.isEmpty {
            start = start.tree(grandTotal: grandTotal)
            grandTotal = grandTotal.union(start)
            print(moves, start.count)
            
            if !found {
                for i in start {
                    if i.players() == 1 {
                        found = true
                        print(i.grid)
                        print(i.moveHistory)
                    }
                }
            }
            
            moves += 1
        }
    }
    
    func allPossibleMoves() -> Set<PegSolitaireHex> {
        var total: Set<Self> = []
        
        func hop(x: Int, y: Int, midX: Int, midY: Int, newX: Int, newY: Int) {
            var copy = self
            
            if copy.posAt(x, y) == .peg {
                // RULE: If a peg hops over a peg, the hopped over peg disappears
                if copy.posAt(midX, midY) == .peg {
                    copy.setTo(midX, midY, .empty)
                }
                copy.setTo(newX, newY, .peg)
            } else if copy.posAt(x, y) == .wall {
                // RULE: Walls can only hop over walls
                if copy.posAt(midX, midY) != .wall {
                    return
                }
                copy.setTo(newX, newY, .wall)
            }
            
            copy.setTo(x, y, .empty)
            copy.moveHistory.append(((x, y), (newX, newY)))
            total.insert(copy)
        }

        for x in 0..<width {
            for y in 0..<height {
                
                if validHop(x: x, y: y, midX: x + 1, midY: y, newX: x + 2, newY: y) {
                    hop(x: x, y: y, midX: x + 1, midY: y, newX: x + 2, newY: y)
                }
                if validHop(x: x, y: y, midX: x - 1, midY: y, newX: x - 2, newY: y) {
                    hop(x: x, y: y, midX: x - 1, midY: y, newX: x - 2, newY: y)
                }
                
                if y % 2 == 0 {
                    
                    if validHop(x: x, y: y, midX: x, midY: y + 1, newX: x + 1, newY: y + 2) {
                        hop(x: x, y: y, midX: x, midY: y + 1, newX: x + 1, newY: y + 2)
                    }
                    if validHop(x: x, y: y, midX: x - 1, midY: y + 1, newX: x - 1, newY: y + 2) {
                        hop(x: x, y: y, midX: x - 1, midY: y + 1, newX: x - 1, newY: y + 2)
                    }
                    if validHop(x: x, y: y, midX: x, midY: y - 1, newX: x + 1, newY: y - 2) {
                        hop(x: x, y: y, midX: x, midY: y - 1, newX: x + 1, newY: y - 2)
                    }
                    if validHop(x: x, y: y, midX: x - 1, midY: y - 1, newX: x - 1, newY: y - 2) {
                        hop(x: x, y: y, midX: x - 1, midY: y - 1, newX: x - 1, newY: y - 2)
                    }
                    
                } else {
                    
                    if validHop(x: x, y: y, midX: x + 1, midY: y + 1, newX: x + 1, newY: y + 2) {
                        hop(x: x, y: y, midX: x + 1, midY: y + 1, newX: x + 1, newY: y + 2)
                    }
                    if validHop(x: x, y: y, midX: x, midY: y + 1, newX: x - 1, newY: y + 2) {
                        hop(x: x, y: y, midX: x, midY: y + 1, newX: x - 1, newY: y + 2)
                    }
                    if validHop(x: x, y: y, midX: x + 1, midY: y - 1, newX: x + 1, newY: y - 2) {
                        hop(x: x, y: y, midX: x + 1, midY: y - 1, newX: x + 1, newY: y - 2)
                    }
                    if validHop(x: x, y: y, midX: x, midY: y - 1, newX: x - 1, newY: y - 2) {
                        hop(x: x, y: y, midX: x, midY: y - 1, newX: x - 1, newY: y - 2)
                    }
                    
                }
                
            }
        }
        
        return total
    }
    
    func validHop(x: Int, y: Int, midX: Int, midY: Int, newX: Int, newY: Int) -> Bool {
        // Attempting to select an empty space
        if posAt(x, y) == .empty { return false }
        if posAt(x, y) == .trueWall { return false }
        
        // Attempting to hop off board
        if newX < 0 || newX >= width || newY < 0 || newY >= height { return false }
        
        // Attempting to hop over an empty space
        if posAt(midX, midY) == .empty { return false }
        if posAt(midX, midY) == .trueWall { return false }
        
        // Attempting to hop onto a reserved space
        if posAt(newX, newY) != .empty { return false }
        
        return true
    }
    
    func posAt(_ x: Int,_ y: Int) -> PegType {
        return grid[y][x]
    }
    mutating func setTo(_ x: Int,_ y: Int, _ to: PegType) {
        grid[y][x] = to
    }
    
}
