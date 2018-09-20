import SceneKit
import SpriteKit
import PlaygroundSupport

let sceneView = SCNView(frame: CGRect(x:0, y:0, width:500, height:500))
sceneView.allowsCameraControl = true
let scene = SCNScene()
sceneView.scene = scene
sceneView.backgroundColor = SKColor.lightGray

PlaygroundPage.current.liveView = sceneView

let earthNode = EarthNode()
let tiltNode = SCNNode()

let isSummer = true
let tiltAngle = isSummer ? 23.4 : -23.4

tiltNode.eulerAngles = SCNVector3(tiltAngle * (.pi / 180.0), 0, 0)
tiltNode.addChildNode(earthNode)
scene.rootNode.addChildNode(tiltNode)

// Create a strong light
let light = SCNLight()
light.type = .directional
light.temperature = 6300
light.intensity = 3500
light.castsShadow = true
light.shadowSampleCount = 16
light.shadowBias = 2
light.shadowRadius = 10

let lightNode = SCNNode()
lightNode.light = light

scene.rootNode.addChildNode(lightNode)
