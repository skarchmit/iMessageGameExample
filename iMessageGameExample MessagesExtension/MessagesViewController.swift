//
//  MessagesViewController.swift
//  iMessageGameExample MessagesExtension
//
//  Created by serge on 4/24/20.
//

import iMessageGame
import Messages
import SpriteKit
import UIKit

class MessagesViewController: iMessageGame.MessagesVC {
    /// Override with a custom GameType
    override var gameType: Game.Type {
        get {
            return ThisGame.self
        } set {}
    }

    override func viewDidLoad() {
        print("viewDidLoad MessagesViewController")

        let activeGame = SceneInfo(fileNamed: "GameScene", scene: GameScene.self)
        let newGame = SceneInfo(fileNamed: "NewGameScene", scene: NewGameScene.self)

        sceneManager.active = activeGame
        sceneManager.new = newGame

        super.viewDidLoad()
    }
}
