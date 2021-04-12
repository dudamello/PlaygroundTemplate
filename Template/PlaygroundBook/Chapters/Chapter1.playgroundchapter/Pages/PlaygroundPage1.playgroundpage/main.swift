/*:
  - Note: For better experience use this Playground in split landscape
 # Objects
For these experience try typing one of these:
 
 * callout(Objects):
 
    `.macbook`\
    `.iPhone`\
    `.camera`\
    `.watch`
 
 
Change the subject and then click **Run My Code**!
When you’re done, go to [next page](@next)! 😄
*/
//#-hidden-code
import PlaygroundSupport
import SpriteKit
import BookCore
//#-end-hidden-code
var myObject : Objects = /*#-editable-code*/.macbook/*#-end-editable-code*/

//#-hidden-code
// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 683, height: 1024))
if let scene = Main1(fileNamed: "Main1") {
    // Set the scale mode
    scene.scaleMode = .aspectFit
    scene.editableCode = myObject

    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//The sound effect I used is Creative Commons that can be found at www.soundbible.com by the name “Blop" recorded by Mark DiAngelo.
//#-end-hidden-code
