//
//  PegSolitaireAdvanced.swift
//  PegSolitaire
//
//  Created by Jonathan Pappas on 12/16/21.
//

import Foundation

enum PegType {
    case peg, empty, wall, trueWall
}

extension Set where Element == PegSolitaireAdvanced {
    func tree(grandTotal: Self) -> Self {
        var total: Self = []
        for i in self {
            total = total.union(i.allPossibleMoves())
        }
        return total.subtracting(grandTotal)
    }
}
extension Array where Element == String {
    func convertTo() -> [[PegType]] {
        
        var new: [[PegType]] = []
        for i in self {
            new.append([])
            for j in i {
                switch j {
                case "e"," ": new[new.count-1].append(.empty)
                case "p": new[new.count-1].append(.peg)
                case "w": new[new.count-1].append(.wall)
                case "•": new[new.count-1].append(.trueWall)
                default: fatalError()
                }
            }
        }
        return new
    }
}

struct PegSolitaireAdvanced: Hashable {
    var width: Int = 5
    var height: Int = 5
    var grid: [[PegType]]
    
    func hash(into hasher: inout Hasher) { hasher.combine(grid) }
    static func ==(lhs: Self, rhs: Self) -> Bool { lhs.grid == rhs.grid }
    var moveHistory: [((Int, Int), (Int, Int))] = []
    func players() -> Int {
        return grid.reduce(0) { i, j in i + j.filter({ $0 == .peg }).count }
    }
    
    init() {
        //grid = .init(repeating: .init(repeating: .peg, count: height), count: width)
        
        grid = [
            "  w p",
            "  ww ",
            "     ",
            "    w",
            " p   ",
        ].convertTo()
        
        
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
    
    func allPossibleMoves() -> Set<PegSolitaireAdvanced> {
        var total: Set<Self> = []
        
        for x in 0..<width {
            for y in 0..<height {
                let directions = [(1,0),(-1,0), (0,1), (0,-1)]
                for (dx, dy) in directions {
                    if validHop(x: x, y: y, dx: dx, dy: dy) {
                        var copy = self
                        
                        if copy.grid[x][y] == .peg {
                            // RULE: If a peg hops over a peg, the hopped over peg disappears
                            if copy.grid[x + dx][y + dy] == .peg {
                                copy.grid[x + dx][y + dy] = .empty
                            }
                            copy.grid[x + dx + dx][y + dy + dy] = .peg
                        } else if copy.grid[x][y] == .wall {
                            // RULE: Walls can only hop over walls
                            if copy.grid[x + dx][y + dy] != .wall {
                                continue
                            }
                            copy.grid[x + dx + dx][y + dy + dy] = .wall
                        }
                        
                        copy.grid[x][y] = .empty
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
        if grid[x][y] == .empty { return false }
        if grid[x][y] == .trueWall { return false }
        
        // Attempting to hop off board
        let newX = x + dx + dx
        let newY = y + dy + dy
        if newX < 0 || newX >= width || newY < 0 || newY >= height { return false }
        
        // Attempting to hop over an empty space
        if grid[x + dx][y + dy] == .empty { return false }
        if grid[x + dx][y + dy] == .trueWall { return false }
        
        // Attempting to hop onto a reserved space
        if grid[newX][newY] != .empty { return false }
        
        return true
    }
    
}
