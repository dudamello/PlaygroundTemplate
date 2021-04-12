//
//  Main3.swift
//  BookCore
//
//  Created by Eduarda Mello on 12/04/21.
//

import Foundation
import PlaygroundSupport
import SpriteKit

public class Main3 : SKScene {
    public var background : SKSpriteNode!
    public var pandas : SKSpriteNode!
    public var ionic : SKSpriteNode!
    public var swiftui : SKSpriteNode!
    public var spritekit : SKSpriteNode!
    public var done : SKSpriteNode!
    
    
    public var pandasRight = SKSpriteNode(imageNamed: "right")
    public var pandasWrong = SKSpriteNode(imageNamed: "wrong")
    public var ionicRight = SKSpriteNode(imageNamed: "right")
    public var ionicWrong = SKSpriteNode(imageNamed: "wrong")
    public var swiftuiRight = SKSpriteNode(imageNamed: "right")
    public var swiftuiWrong = SKSpriteNode(imageNamed: "wrong")
    public var spritekitRight = SKSpriteNode(imageNamed: "right")
    public var spritekitWrong = SKSpriteNode(imageNamed: "wrong")
    
    public var pandasClicked = false
    public var ionicClicked = false
    public var swiftuiClicked = false
    public var spritekitClicked = false
    public var doneClicked = false
    
    override public func didMove(to view: SKView) {
        background = childNode(withName: "background") as? SKSpriteNode
        pandas = childNode(withName: "pandas") as? SKSpriteNode
        ionic = childNode(withName: "ionic") as? SKSpriteNode
        swiftui = childNode(withName: "swiftui") as? SKSpriteNode
        spritekit = childNode(withName: "spritekit") as? SKSpriteNode
        done = childNode(withName: "done") as? SKSpriteNode
        
    }

    func touchDown(atPoint pos : CGPoint) {
        if pandas.contains(pos) && !doneClicked {
            if !pandasClicked {
                pandas.texture = SKTexture(imageNamed: "pandasSelected")
                pandasClicked = true
            } else {
                pandas.texture = SKTexture(imageNamed: "pandas")
                pandasClicked = false
            }
        }
        
        if ionic.contains(pos) && !doneClicked {
            if !ionicClicked {
                ionic.texture = SKTexture(imageNamed: "ionicSelected")
                ionicClicked = true
            } else {
                ionic.texture = SKTexture(imageNamed: "ionic")
                ionicClicked = false
            }
        }
        
        if swiftui.contains(pos) && !doneClicked {
            if !swiftuiClicked {
                swiftui.texture = SKTexture(imageNamed: "swiftuiSelected")
                swiftuiClicked = true
            } else {
                swiftui.texture = SKTexture(imageNamed: "swiftui")
                swiftuiClicked = false
            }
        }
        
        if spritekit.contains(pos) && !doneClicked {
            if !spritekitClicked {
                spritekit.texture = SKTexture(imageNamed: "spritekitSelected")
                spritekitClicked = true
            } else {
                spritekit.texture = SKTexture(imageNamed: "spritekit")
                spritekitClicked = false
            }
        }
        
        if done.contains(pos) {
            doneClicked = true
            if pandasClicked {
                pandasWrong.position = CGPoint(x: -44.744, y: 249.261)
                self.addChild(pandasWrong)
            } else {
                pandasRight.position = CGPoint(x: -44.744, y: 249.261)
                self.addChild(pandasRight)
            }
            
            if ionicClicked {
                ionicWrong.position = CGPoint(x: -44.744, y: -16.827)
                self.addChild(ionicWrong)
            } else {
                ionicRight.position = CGPoint(x: -44.744, y: -16.827)
                self.addChild(ionicRight)
            }
            
            if swiftuiClicked {
                swiftuiRight.position = CGPoint(x: 285, y: 249.261)
                self.addChild(swiftuiRight)
            } else {
                swiftuiWrong.position = CGPoint(x: 285, y: 249.261)
                self.addChild(swiftuiWrong)
            }
            
            if spritekitClicked {
                spritekitRight.position = CGPoint(x: 285, y: -16.827)
                self.addChild(spritekitRight)
            } else {
                spritekitWrong.position = CGPoint(x: 285, y: -16.827)
                self.addChild(spritekitWrong)
            }
            
            PlaygroundPage.current.assessmentStatus = .pass(message: "Now that you know which of these are apple frameworks, go to the [next page](@next)!")
        }
        
    }

    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
    }

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
