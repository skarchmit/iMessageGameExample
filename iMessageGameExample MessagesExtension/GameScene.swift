//
//  gameScene.swift
//  iMessageGameExample MessagesExtension
//
//  Created by serge on 4/27/20.
//

import Foundation
import iMessageGame
import Logging
import SpriteKit

class GameScene: iMessageGame.Scene {
    private var sendTurnButton: SKSpriteNode!
    private var sceneVariablesInitialized: Bool = false

    override var game: Game! {
        didSet {
            if sceneVariablesInitialized {
                updateObjects()
                log.info("[GameScene] Game Updated")
            } else {
                log.info("didMove will need to update the game variables.")
            }
        }
    }

    override func didMove(to view: SKView) {
        log.info("Moved to view.")
        super.didMove(to: view)
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        // Identify sprites in sks
        sendTurnButton = childNode(withName: "sendTurnButton") as? SKSpriteNode

        sceneVariablesInitialized = true
        // Update objects
        updateObjects()
    }

    func updateObjects() {
        log.info("Updating scene")
        for player in game.players {
            log.info("[GameScene] Player: \(player.uuid): \(player.score)")
        }

        log.info("[GameScene] Current: \(game.players.current.uuid): \(game.players.current.score)")
        log.info("[GameScene] Yourself: \(game.players.yourself.uuid): \(game.players.yourself.score)")
        log.info("[GameScene] Your Turn: \(game.players.current == game.players.yourself)")
        log.info("[GameScene] Player count: \(game.players.count)")
        log.info("[GameScene] canSendGame: \(game.canSend)")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = nodes(at: location)

        log.info("[touchesEnded] [GameScene] canSendGame: \(game.canSend)")
        for node in touchedNode {
            if node.name == sendTurnButton?.name {
                if !game.canSend {
                    log.info("Cannot Send the game!")
                    log.info("Player count: \(game.players.count)")
                    log.info("Your Turn: \(game.players.current == game.players.yourself)")
                    continue
                } else {
                    if let d = gameDelegate {
                        /// Update the current score by 1 and switch to next player
                        game?.players.current.score += 1
                        game?.players.next()

                        d.send(caption: "Played Turn", summaryText: "Played their turn", withConfirmation: false)
                        log.info("Sent Game")
                    }
                }
            }
        }
    }
}
