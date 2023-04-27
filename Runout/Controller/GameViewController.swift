//
//  GameViewController.swift
//  Runout
//

import UIKit
import SpriteKit
import AVFoundation

var backgroundMusicPlayer: AVAudioPlayer!

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        presentMenuScene()
        startBackgroundMusic()
    }
    
    func startBackgroundMusic() {
        let path = Bundle.main.path(forResource: "background", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        backgroundMusicPlayer = try! AVAudioPlayer(contentsOf: url)
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.play()
    }

}

extension GameViewController: SceneManagerDelegate {
    
    func presentMenuScene() {
        let scene = MenuScene(size: view.bounds.size)
        scene.scaleMode = .aspectFill
        scene.sceneManagerDelegate = self
        present(scene: scene)
    }
    
    func presentLevelScene() {
        let scene = LevelScene(size: view.bounds.size)
        scene.scaleMode = .aspectFill
        scene.sceneManagerDelegate = self
        present(scene: scene)
        backgroundMusicPlayer.stop()
        startBackgroundMusic()
    }
    
    func presentGameScene(for level: Int) {
        let scene = GameScene(size: view.bounds.size, level: level, sceneManagerDelegate: self)
        scene.scaleMode = .aspectFill
        present(scene: scene)
    }
    
    func present(scene: SKScene) {
        if let view = self.view as! SKView? {
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
            view.showsPhysics = false
        }
    }
    
}



















