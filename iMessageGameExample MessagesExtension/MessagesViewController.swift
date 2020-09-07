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
		self.gameScene = GameScene(fileNamed: "GameScene")
		self.newGameScene = NewGameScene(fileNamed: "NewGameScene")
        
//        self.gameScene.gameDelegate = self
//        self.newGameScene.gameDelegate = self
        
		super.viewDidLoad()
	}

}
