//
//  Tile.swift
//  PegSolitaireSpriteKit
//
//  Created by Jonathan Pappas on 12/17/21.
//

import Foundation
import SpriteKit

#if os(iOS)
typealias NSColor = UIColor
#endif

class Tile: SKShapeNode {
    var peg = SKShapeNode(circleOfRadius: 40)
    var type: PegType = .empty
    
    func setTo(_ this: PegType) {
        self.alpha = 1
        peg.alpha = 0
        peg.strokeColor = .clear
        peg.fillColor = .clear
        type = this
        
        if this == .empty {
            self.fillColor = .lightGray
        }
        if this == .peg {
            peg.fillColor = .black
            peg.alpha = 1
        }
        if this == .wall {
            self.fillColor = .black
        }
        if this == .trueWall {
            self.fillColor = .clear
        }
    }
    
    static func Make(x: Int, y: Int, square: Bool) -> Tile {
        let tile = square
            ? Tile.init(rectOf: .init(width: 100, height: 100), cornerRadius: 10)
            : Tile.init(circleOfRadius: 50)
        
        tile.strokeColor = .clear
        tile.fillColor = NSColor(red: 0.3, green: 0.6, blue: 0.2, alpha: 1)
        tile.position = CGPoint(x: x * 110, y: y * 110)
        tile.name = "\(x) \(y)"
        
        tile.addChild(tile.peg)
        tile.setTo(.empty)
        
        return tile
    }
}
