//
//  Main2.swift
//  BookCore
//
//  Created by Eduarda Mello on 12/04/21.
//

import PlaygroundSupport
import SpriteKit
import AVFoundation

public class Main2: SKScene, SKPhysicsContactDelegate {

    public var background : SKSpriteNode!
    public var sirikitIcon : SKSpriteNode!
    public var healthkitIcon : SKSpriteNode!
    public var spritekitIcon : SKSpriteNode!
    public var cloudkitIcon : SKSpriteNode!
    public var sirikitCard : SKSpriteNode!
    public var healthkitCard : SKSpriteNode!
    public var spritekitCard : SKSpriteNode!
    public var cloudkitCard : SKSpriteNode!
    
    public var siriMoved = false
    public var cloudkitMoved = false
    public var healthkitMoved = false
    public var spritekitMoved = false
    
    public var pictures = [SKSpriteNode]()
    public var dragging : SKSpriteNode!
    var zTop: CGFloat = 1
    
    override public func didMove(to view: SKView) {
        background = childNode(withName: "background") as? SKSpriteNode
        sirikitIcon = childNode(withName: "sirikitIcon") as? SKSpriteNode
        healthkitIcon = childNode(withName: "healthkitIcon") as? SKSpriteNode
        spritekitIcon = childNode(withName: "spritekitIcon") as? SKSpriteNode
        cloudkitIcon = childNode(withName: "cloudkitIcon") as? SKSpriteNode
        sirikitCard = childNode(withName: "sirikitCard") as? SKSpriteNode
        healthkitCard = childNode(withName: "healthkitCard") as? SKSpriteNode
        spritekitCard =  childNode(withName: "spritekitCard") as? SKSpriteNode
        cloudkitCard =  childNode(withName: "cloudkitCard") as? SKSpriteNode
        
        sirikitIcon.setScale(0.5)
        healthkitIcon.setScale(0.5)
        spritekitIcon.setScale(0.5)
        cloudkitIcon.setScale(0.5)
        
        pictures.append(sirikitIcon)
        pictures.append(healthkitIcon)
        pictures.append(spritekitIcon)
        pictures.append(cloudkitIcon)
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { timer in
            PlaygroundPage.current.assessmentStatus = .pass(message: "Cool! When you are ready to go to the [next page](@next)!")
            
        }
    
        
    }


    
    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if sirikitIcon.contains(pos) {
            dragging = sirikitIcon
            sirikitIcon.zPosition = zTop
            zTop += 1
            
            siriMoved = true
        }
        if healthkitIcon.contains(pos) {
            dragging = healthkitIcon
            healthkitIcon.zPosition = zTop
            zTop += 1
            
            healthkitMoved = true
        }
        if spritekitIcon.contains(pos) {
            dragging = spritekitIcon
            spritekitIcon.zPosition = zTop
            zTop += 1
            
            spritekitMoved = true
        }
        if cloudkitIcon.contains(pos) {
            dragging = cloudkitIcon
            cloudkitIcon.zPosition = zTop
            zTop += 1
            
            cloudkitMoved = true
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if dragging != nil {
            dragging.position = pos
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if dragging != nil {
            dragging.setScale(1)
            dragging = nil
        }
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
