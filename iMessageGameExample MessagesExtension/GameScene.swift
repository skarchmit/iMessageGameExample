//
//  gameScene.swift
//  iMessageGameExample MessagesExtension
//
//  Created by serge on 4/27/20.
//

import Foundation
import iMessageGame
import SpriteKit

//class GameScene: iMessageGame.Scene{
//
//}

class GameScene: SKScene {
	
	override func willMove(from view: SKView) {
		super.willMove(from: view)
		self.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
		print ("will Move to GameScene")
	}
	
	
}
