

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var scoreLabel: SKLabelNode!
    var score = 0
    
    override func didMove(to view: SKView) {
        // Make a repeating action that will call the method makeBox below
        let wait = SKAction.wait(forDuration: 1.5) // Make a wait
        // This block will call the function below
        let makeABox = SKAction.run {
            self.makeBox()  // You must use self inside a block!
        }
        
        let seq = SKAction.sequence([wait, makeABox])   // Make a sequence
        let rep = SKAction.repeatForever(seq)           // Make a repeat forever

        run(rep) // Run the repeat action and the sequence runs forever!
    }
    
    
    // -----------------------------------------------------------------
    // This function makes boxes
    
    func makeBox() {
        let box = Box()
        
        // Get a random position within the width of the scene
        let x = CGFloat( random(n: Int(size.width - 40)) + 20)
        
        // Position the box
        box.position.x = x
        box.position.y = 0
        // Add the box
        
        addChild(box)
        
        // Create an action to move the box up the screen
        let moveUp = SKAction.moveTo(y: size.height, duration: 4)
        let seq = SKAction.sequence([moveUp, .removeFromParent()])
        box.run(seq)
    }
    
    // Returns a random int from 0 to n - 1
    func random(n: Int) -> Int {
        return Int(arc4random()) % n
    }
    
    // ------------------------------------------------------------------------
    // Handle touch events
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // touches is a set, get the first element of the set
        if let touch = touches.first {
            // Get the location of this touch in the scene
            let location = touch.location(in: self)
            let node = atPoint(location)    // Find the node at this location
            if node.name == "box" {         // Check the name of the node
                node.removeFromParent()     // If it's "box" remove it
                //                score += 1
                //                scoreLabel.text = "Score: \(score)"
            }
        }
    }
    
    
    
    
    func outoforder(n: Int) {
        var start = 0
        var end = n
        for i in 0 ... n {
            if i % 2 == 0 {
                print(start)
                start += 1
            } else {
                print(end)
                end -= 1
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
