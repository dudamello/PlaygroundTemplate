//
//  Main1.swift
//  BookCore
//
//  Created by Eduarda Mello on 12/04/21.
//

import PlaygroundSupport
import SpriteKit
import AVFoundation

public enum Objects : Int {
    case macbook
    case iPhone
    case camera
    case watch
}

public class Main1: SKScene {

    public var background : SKSpriteNode!
    public var tap : SKSpriteNode!
    public var ellipse : SKSpriteNode!
    
    public var editableCode : Objects = .macbook
    public var objects : [Objects] = []
    
    public var imgMacbook = SKSpriteNode(imageNamed: "mac")
    public var imgiPhone = SKSpriteNode(imageNamed: "iphone")
    public var imgCamera = SKSpriteNode(imageNamed: "camera")
    public var imgWatch = SKSpriteNode(imageNamed: "watch")
    
    override public func didMove(to view: SKView) {
        
        tap = childNode(withName: "tap") as? SKSpriteNode
        ellipse = childNode(withName: "ellipse") as? SKSpriteNode
        
        
        imgMacbook.position = CGPoint(x: 0.5, y: -71.887)
        imgiPhone.position = CGPoint(x: 0.5, y: -71.887)
        imgCamera.position = CGPoint(x: 0.5, y: -71.887)
        imgWatch.position = CGPoint(x: 0.5, y: -71.887)
        
 
        
        if case let .array(values) = PlaygroundKeyValueStore.current["ld"] {
            for case let .integer(value) in values {
                objects.append(Objects(rawValue: value)!)
                
            }
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
        if ellipse.contains(pos) {
            tap.alpha = 0.0
            if editableCode == .macbook {
                self.addChild(imgMacbook)
            }
            if editableCode == .iPhone {
                self.addChild(imgiPhone)
            }
            if editableCode == .camera {
                self.addChild(imgCamera)
            }
            if editableCode == .watch {
                self.addChild(imgWatch)
            }
        
        
            
            if !objects.contains(editableCode) {
                objects.append(editableCode)
                PlaygroundKeyValueStore.current["ld"] = .array(objects.map({PlaygroundValue.integer($0.rawValue)}))
            
            }
            if objects.count == 4 {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Now that you saw all the objects go to the [next page](@next)")
            }
            
        } else {
            PlaygroundPage.current.assessmentStatus = .fail(hints: ["Click on tap to see the object!"], solution: nil)
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



