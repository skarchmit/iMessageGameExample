//
//  NewGameScene.swift
//  iMessageGameExample MessagesExtension
//
//  Created by serge on 4/27/20.
//

import Foundation
import iMessageGame
import SpriteKit


class NewGameScene: SKScene {

	private var button: SKSpriteNode!
    
    /// Required to have to connect back to the original VC
    weak var gameDelegate: iMessageGame.MessagesVC?
	
	override func didMove(to view: SKView) {
		super.willMove(from: view)
		self.backgroundColor = #colorLiteral(red: 0.1485076821, green: 0.1634827325, blue: 0.3019607961, alpha: 1)
		button = childNode(withName: "button") as? SKSpriteNode
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesEnded(touches, with: event)
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)
		let touchedNode = self.nodes(at: location)
		
		for node in touchedNode {
			if node.name == "newGameButton" {
                if let o = self.gameDelegate {
                    o.game = Game()
                    let message = o.composeMessage(caption: "Let's play a game!", summaryText: "Sent a game.")
                    o.send(message: message, withConfirmation: true)
                }
				print ("Button Touched!")
			}
		}
	}
	
}
