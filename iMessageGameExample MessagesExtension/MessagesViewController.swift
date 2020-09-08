//
//  MessagesViewController.swift
//  iMessageGameExample MessagesExtension
//
//  Created by serge on 4/24/20.
//

import UIKit
import Messages
import iMessageGame
import SpriteKit

class MessagesViewController: iMessageGame.MessagesVC {
 
	override func viewDidLoad() {
		print ("viewDidLoad MessagesViewController")
        
		let activeGameScene = GameScene(fileNamed: "GameScene")
		let newGameScene = NewGameScene(fileNamed: "NewGameScene")
        self.scenes = Scenes(active: activeGameScene, new: newGameScene)
		super.viewDidLoad()
	}

}
