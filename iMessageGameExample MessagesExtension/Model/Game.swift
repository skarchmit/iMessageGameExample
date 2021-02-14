//
//  Game.swift
//  iMessageGameExample MessagesExtension
//
//  Created by Sergey Karchmit on 9/5/20.
//

import Foundation
import iMessageGame

class ThisGame: iMessageGame.Game {
    public var a: Int = 5
    public var b: Int = 6

    func incrementA() {
        a += 1
    }

    func incrementB() {
        b += 1
    }
}
