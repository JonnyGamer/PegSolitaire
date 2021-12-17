//
//  GameScene.swift
//  PegSolitaireSpriteKit
//
//  Created by Jonathan Pappas on 12/17/21.
//

import SpriteKit
import GameplayKit

class PegScene: SKScene {
    var pegSolitaire: PegSolitaireSpriteKit = .init()
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        
        // Create the tiles and references
        let boardNode = SKNode()
        pegSolitaire.tiles = .init(repeating: [], count: pegSolitaire.width)
        for x in 0..<pegSolitaire.width {
            for y in 0..<pegSolitaire.height {
                let tile = Tile.Make(x: x, y: y, square: true)
                boardNode.addChild(tile)
                pegSolitaire.tiles[x].append(tile)
                tile.setTo(pegSolitaire.representation.grid[x][y])
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

class PegSolitaireSpriteKit {
    var representation: PegSolitaireAdvanced = PegSolitaireAdvanced()
    var width: Int { representation.width }
    var height: Int { representation.height }
    
    var tiles: [[Tile]] = [[]]
    var selected: (x: Int, y: Int, tile: Tile)?
    var pegsLeftLabel: SKLabelNode = SKLabelNode(text: "_ Pegs Left")
    var history: [PegSolitaireAdvanced] = []
    
    func tapped(x: Int, y: Int, tile: Tile) {
        let was = representation
        
        func realFlip(x: Int, y: Int, dx: Int, dy: Int, hopping: Tile) {
            if representation.validHop(x: x, y: y, dx: dx, dy: dy) {
                representation.hop(x: x, y: y, dx: dx, dy: dy)
                
                tiles[x + dx + dx][y + dy + dy].setTo(hopping.type)
                if hopping.type == .peg {
                    if tiles[x + dx][y + dy].type == .peg {
                        tiles[x + dx][y + dy].setTo(.empty)
                    }
                }
                hopping.setTo(.empty)
                selected = nil
                history.append(was)
            }
        }
        
        if let s = selected {
            if tile === s.tile {
                // deselect
                tile.alpha = 1
                selected = nil
            } else if tile.type == .empty {
                if x == s.x {
                    if y == s.y + 2 {
                        realFlip(x: s.x, y: s.y, dx: 0, dy: 1, hopping: s.tile)
                    } else if y == s.y - 2 {
                        realFlip(x: s.x, y: s.y, dx: 0, dy: -1, hopping: s.tile)
                    }
                } else if y == s.y {
                    if x == s.x + 2 {
                        realFlip(x: s.x, y: s.y, dx: 1, dy: 0, hopping: s.tile)
                    } else if x == s.x - 2 {
                        realFlip(x: s.x, y: s.y, dx: -1, dy: 0, hopping: s.tile)
                    }
                } else {
                    s.tile.alpha = 1
                    selected = (x, y, tile)
                    tile.alpha = 0.5
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
