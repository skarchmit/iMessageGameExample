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
    private var playerLabel: SKLabelNode?
    private var oppenentLabel: SKLabelNode?
    private var waitingBanner: SKSpriteNode?

    private var canSendGame: Bool {
        return game.players.current != game.players.yourself && game.players.count >= 2
    }

    override var game: Game! {
        didSet {
            log.info("Received a new game!")
            updateObjects()
        }
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        // Identify sprites in sks
        sendTurnButton = childNode(withName: "sendTurnButton") as? SKSpriteNode
        playerLabel = childNode(withName: "PlayerLabel") as? SKLabelNode
        oppenentLabel = childNode(withName: "OpponentLabel") as? SKLabelNode
        waitingBanner = childNode(withName: "WaitingBanner") as? SKSpriteNode

        log.info("Updating objects after view")
//        lockSending = game.players.current != game.players.yourself
        updateObjects()
    }

    func updateObjects() {
        log.info("Updating scene")
        if game.players.count < 2 {
            // Could probably use more banners for this.
            log.info("Unable to update scene because no players in game.")
            waitingBanner?.alpha = 1.0
            return
        }

        if canSendGame {
            waitingBanner?.alpha = 1.0
        } else {
            waitingBanner?.alpha = 0.0
        }

        /// Assume we have 2 players
        let player_string: String = "Player: \(game.players[0].score)"
        let opponent_string: String = "Opponent: \(game.players[1].score)"

        playerLabel?.text = player_string
        oppenentLabel?.text = opponent_string
        log.info("Updated scene.")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = nodes(at: location)

        for node in touchedNode {
            if node.name == sendTurnButton?.name && canSendGame {
                if let d = gameDelegate {
                    /// Update the current score by 1 and switch to next player
                    game?.players.current.score += 1
                    game?.players.next()

                    d.send(caption: "Played Turn", summaryText: "Played their turn", withConfirmation: false)
                }
                print("Send turn button Touched!")
            }
        }
    }
}
