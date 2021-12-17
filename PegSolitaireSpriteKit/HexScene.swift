//
//  HexScene.swift
//  PegSolitaireSpriteKit
//
//  Created by Jonathan Pappas on 12/17/21.
//

import SpriteKit
import GameplayKit

class HexScene: SKScene {
    var pegSolitaire: PegSolitaireHexSpriteKit = .init()
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        
        // Create the tiles and references
        let boardNode = SKNode()
        pegSolitaire.tiles = .init(repeating: [], count: pegSolitaire.width)
        for x in 0..<pegSolitaire.width {
            for y in 0..<pegSolitaire.height {
                let tile = Tile.Make(x: x, y: y, square: true)
                if y % 2 == 1 { tile.position.x += 50 }
                boardNode.addChild(tile)
                pegSolitaire.tiles[x].append(tile)
                tile.setTo(pegSolitaire.representation.posAt(x, y))
            }
        }
        addChild(boardNode)
        
        // Reposition the Grid so that it fits and is centered no matter what dimensions it is
        var perfect = boardNode.calculateAccumulatedFrame()
        let maximum = max(perfect.width, perfect.height)
        boardNode.setScale(850 / maximum)
        perfect = boardNode.calculateAccumulatedFrame()
        // Center the grid
        boardNode.position.x = 500 - (perfect.width/2)
        boardNode.position.y = 500 - (perfect.height/2)
        // The grid was off by half a tile
        boardNode.position.x += 50 * boardNode.xScale
        boardNode.position.y += 50 * boardNode.xScale
        
        // Turn Label
        pegSolitaire.pegsLeftLabel = SKLabelNode.init(text: "\(pegSolitaire.representation.players()) Pegs Left")
        addChild(pegSolitaire.pegsLeftLabel)
        pegSolitaire.pegsLeftLabel.zPosition = 100
        pegSolitaire.pegsLeftLabel.fontColor = .black
        pegSolitaire.pegsLeftLabel.fontName = ""
        pegSolitaire.pegsLeftLabel.position = .init(x: 500, y: 10)
        pegSolitaire.pegsLeftLabel.horizontalAlignmentMode = .center
        pegSolitaire.pegsLeftLabel.setScale(2)
        pegSolitaire.pegsLeftLabel.fontSize *= pegSolitaire.pegsLeftLabel.xScale
        pegSolitaire.pegsLeftLabel.setScale(1)
        
    }
    
    #if os(macOS)
    override func keyDown(with event: NSEvent) {
        undo()
    }
    #endif
    
    func undo() {
        if !pegSolitaire.history.isEmpty {
            pegSolitaire.representation = pegSolitaire.history.removeLast()
            removeAllChildren()
            didMove(to: view!)
        }
    }
    
    #if os(macOS)
    override func mouseDown(with event: NSEvent) {
        // Figure out if you will tap a node with a name of "0 5" or "8 8" or something
        let nodesTapped = nodes(at: event.location(in: self))
        for i in nodesTapped {
            if let nodeName = i.name {
                let splitName = nodeName.split(separator: " ")
                if let x = Int(splitName[0]), let y = Int(splitName[1]) {
                    pegSolitaire.tapped(x: x, y: y, tile: i as! Tile)
                    return
                }
            }
        }
    }
    #endif
    #if os(iOS)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Figure out if you will tap a node with a name of "0 5" or "8 8" or something
        let nodesTapped = nodes(at: touches.first!.location(in: self))
        for i in nodesTapped {
            if let nodeName = i.name {
                let splitName = nodeName.split(separator: " ")
                if let x = Int(splitName[0]), let y = Int(splitName[1]) {
                    pegSolitaire.tapped(x: x, y: y, tile: i as! Tile)
                    return
                }
            }
        }
        if nodesTapped.isEmpty {
            undo()
        }
    }
    #endif
    
}

class PegSolitaireHexSpriteKit {
    var representation: PegSolitaireHex = PegSolitaireHex()
    var width: Int { representation.width }
    var height: Int { representation.height }
    
    var tiles: [[Tile]] = [[]]
    var selected: (x: Int, y: Int, tile: Tile)?
    var pegsLeftLabel: SKLabelNode = SKLabelNode(text: "_ Pegs Left")
    var history: [PegSolitaireHex] = []
    
    func tapped(x: Int, y: Int, tile: Tile) {
        //print(x, y, tile.type, representation.posAt(x, y), tiles[x][y].type)
        //return
        let was = representation
        
        func hop(x: Int, y: Int, midX: Int, midY: Int, newX: Int, newY: Int) {
            if representation.posAt(x, y) == .peg {
                // RULE: If a peg hops over a peg, the hopped over peg disappears
                if representation.posAt(midX, midY) == .peg {
                    representation.setTo(midX, midY, .empty)
                    tiles[midX][midY].setTo(.empty)
                }
                representation.setTo(newX, newY, .peg)
                tiles[newX][newY].setTo(.peg)
            } else if representation.posAt(x, y) == .wall {
                // RULE: Walls can only hop over walls
                if representation.posAt(midX, midY) != .wall {
                    return
                }
                tiles[newX][newY].setTo(.wall)
                representation.setTo(newX, newY, .wall)
            }
            
            representation.setTo(x, y, .empty)
            tiles[x][y].setTo(.empty)
            representation.moveHistory.append(((x, y), (newX, newY)))
            history.append(was)
        }
        
        
        if let s = selected {
            
            if tile === s.tile {
                // deselect
                tile.alpha = 1
                selected = nil
            } else if tile.type == .empty {
                
                if y == s.y {
                    if x == s.x + 2 {
                        if representation.validHop(x: s.x, y: s.y, midX: s.x + 1, midY: s.y, newX: s.x + 2, newY: s.y) {
                            hop(x: s.x, y: s.y, midX: s.x + 1, midY: s.y, newX: s.x + 2, newY: s.y)
                        }
                    } else if x == s.x - 2 {
                        if representation.validHop(x: s.x, y: s.y, midX: s.x - 1, midY: s.y, newX: s.x - 2, newY: s.y) {
                            hop(x: s.x, y: s.y, midX: s.x - 1, midY: s.y, newX: s.x - 2, newY: s.y)
                        }
                    } else {
                        s.tile.alpha = 1
                        selected = (x, y, tile)
                        tile.alpha = 0.5
                    }
                    
                } else if x == s.x - 1 || x == s.x + 1 {
                    
                    if s.y % 2 == 0 {
                        
                        if y == s.y + 2, x == s.x + 1 {
                            if representation.validHop(x: s.x, y: s.y, midX: s.x, midY: s.y + 1, newX: s.x + 1, newY: s.y + 2) {
                                hop(x: s.x, y: s.y, midX: s.x, midY: s.y + 1, newX: s.x + 1, newY: s.y + 2)
                            }
                        } else if y == s.y + 2, x == s.x - 1 {
                            if representation.validHop(x: s.x, y: s.y, midX: s.x - 1, midY: s.y + 1, newX: s.x - 1, newY: s.y + 2) {
                                hop(x: s.x, y: s.y, midX: s.x - 1, midY: s.y + 1, newX: s.x - 1, newY: s.y + 2)
                            }
                        } else if y == s.y - 2, x == s.x + 1 {
                            if representation.validHop(x: s.x, y: s.y, midX: s.x, midY: s.y - 1, newX: s.x + 1, newY: s.y - 2) {
                                hop(x: s.x, y: s.y, midX: s.x, midY: s.y - 1, newX: s.x + 1, newY: s.y - 2)
                            }
                        } else if y == s.y - 2, x == s.x - 1 {
                            if representation.validHop(x: s.x, y: s.y, midX: s.x - 1, midY: s.y - 1, newX: s.x - 1, newY: s.y - 2) {
                                hop(x: s.x, y: s.y, midX: s.x - 1, midY: s.y - 1, newX: s.x - 1, newY: s.y - 2)
                            }
                        }
    
                    } else {
                        
                        if y == s.y + 2, x == s.x + 1 {
                            if representation.validHop(x: s.x, y: s.y, midX: s.x + 1, midY: s.y + 1, newX: s.x + 1, newY: s.y + 2) {
                                hop(x: s.x, y: s.y, midX: s.x + 1, midY: s.y + 1, newX: s.x + 1, newY: s.y + 2)
                            }
                        } else if y == s.y + 2, x == s.x - 1 {
                            if representation.validHop(x: s.x, y: s.y, midX: s.x, midY: s.y + 1, newX: s.x - 1, newY: s.y + 2) {
                                hop(x: s.x, y: s.y, midX: s.x, midY: s.y + 1, newX: s.x - 1, newY: s.y + 2)
                            }
                        } else if y == s.y - 2, x == s.x + 1 {
                            if representation.validHop(x: s.x, y: s.y, midX: s.x + 1, midY: s.y - 1, newX: s.x + 1, newY: s.y - 2) {
                                hop(x: s.x, y: s.y, midX: s.x + 1, midY: s.y - 1, newX: s.x + 1, newY: s.y - 2)
                            }
                        } else if y == s.y - 2, x == s.x - 1 {
                            if representation.validHop(x: s.x, y: s.y, midX: s.x, midY: s.y - 1, newX: s.x - 1, newY: s.y - 2) {
                                hop(x: s.x, y: s.y, midX: s.x, midY: s.y - 1, newX: s.x - 1, newY: s.y - 2)
                            }
                        }
    
                    }
                    
                    
                }
            } else {
                s.tile.alpha = 1
                selected = (x, y, tile)
                tile.alpha = 0.5
            }
            
            
        } else {
            if tile.type == .peg || tile.type == .wall {
                selected = (x, y, tile)
                tile.alpha = 0.5
            }
        }
                

        
        let playersLeft = representation.players()
        if playersLeft == 1 {
            pegsLeftLabel.text = "You Win!"
        } else {
            pegsLeftLabel.text = "\(playersLeft) Pegs Left"
        }
 
    }
}

