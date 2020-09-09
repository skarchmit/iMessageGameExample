//
//  gameScene.swift
//  iMessageGameExample MessagesExtension
//
//  Created by serge on 4/27/20.
//

import Foundation
import iMessageGame 
import SpriteKit


class GameScene: iMessageGame.Scene {
    private var sendTurnButton: SKSpriteNode?
    private var player1Label: SKLabelNode?

    override func didMove(to view: SKView) {
        super.willMove(from: view)
        self.backgroundColor = #colorLiteral(red: 0.1485076821, green: 0.1634827325, blue: 0.3019607961, alpha: 1)
        // Identify sprites in sks
        self.sendTurnButton = childNode(withName: "sendTurnButton") as? SKSpriteNode
        self.player1Label = childNode(withName: "PlayerLabel") as? SKLabelNode
        updateObjects()
    }
    
    func updateObjects() {
        self.player1Label?.text =  "Player1Update"
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = nodes(at: location)

        for node in touchedNode {
            if node.name == sendTurnButton?.name {
                if let d = gameDelegate {
                    print ("sending turn game to game delegate.")
                    d.send(caption: "Played Turn", summaryText: "Played their turn", withConfirmation: false)
                }
                print("Send turn button Touched!")
            }
        }
    }
}
