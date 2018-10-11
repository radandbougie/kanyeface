
//  box.swift
//  test

//  Created by Kandy M on 9/25/18.


import UIKit
import SpriteKit

class Box: SKSpriteNode {
    init() {
        let boxSize = CGSize(width: 300, height: 300)
        super.init(texture: SKTexture(imageNamed: "kanye-west-face-png-6.png"), color: .red, size: boxSize)
        name = "box"
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
