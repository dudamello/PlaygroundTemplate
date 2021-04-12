//
//  LiveView2.swift
//  BookCore
//
//  Created by Eduarda Mello on 12/04/21.
//

import Foundation
import PlaygroundSupport
import SpriteKit

public class LiveView3: SKScene {
    
    public var phrase1 : SKSpriteNode!
   
   override public func didMove(to view: SKView) {
    phrase1 = childNode(withName: "phrase1") as? SKSpriteNode
    let fadeInOut = SKAction.sequence([.fadeIn(withDuration: 1.8),
                                      .fadeOut(withDuration: 1.8)])
    phrase1.run(.repeatForever(fadeInOut))
    
        
   }
   
   @objc public static override var supportsSecureCoding: Bool {
       get {
           return true
       }
   }
   
   func touchDown(atPoint pos : CGPoint) {
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


