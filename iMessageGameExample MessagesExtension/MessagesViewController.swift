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

        let activeGame = SceneLoader(fileNamed: "GameScene", scene: GameScene.self, type: .active)
        let newGame = SceneLoader(fileNamed: "NewGameScene", scene: NewGameScene.self, type: .new)

        sceneManager.add(activeGame)
        sceneManager.add(newGame)

        super.viewDidLoad()
    }
}
