//: Playground - noun: a place where people can play

import SpriteKit
import PlaygroundSupport

let height: CGFloat = 640
let width: CGFloat = height * 3 / 4
let size = CGSize(width: width, height: height)
let skView = SKView(frame: CGRect(x: 0, y: 0, width: width, height: height))
let widthHalf  = width / 2
let heightHalf = height / 2

PlaygroundPage.current.liveView = skView

//------------------------//

class SceneTitle: SKScene {
    let pointer = SKShapeNode(rect: CGRect(x: -10, y: -10, width: 20, height: 200))
    
    override init(size: CGSize) {
        super.init(size: size)
        
        let background = SKShapeNode(circleOfRadius: 220)
        background.fillColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        background.position = CGPoint(x: widthHalf, y: heightHalf)
        
        pointer.fillColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        pointer.position = background.position
        pointer.zPosition = 1.0
        
        addChild(background)
        addChild(pointer)
        
        let label1 = SKLabelNode(text: "Click on the SpriteKit view to start,\npress any key for a random spin. ")
        label1.position.x = widthHalf
        label1.numberOfLines = 2 // Swift 4 SpriteKit feature
        addChild(label1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func keyUp(with event: NSEvent) {
        pointer.run(.rotate(byAngle: CGFloat.pi * CGFloat(arc4random() % 18) / 9 + CGFloat.pi * 2, duration: 0.5))
    }
}

//------------------------//

skView.presentScene(SceneTitle(size: size))

