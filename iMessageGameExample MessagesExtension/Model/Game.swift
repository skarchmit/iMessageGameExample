//
//  Game.swift
//  iMessageGameExample MessagesExtension
//
//  Created by Sergey Karchmit on 9/5/20.
//

import Foundation
import iMessageGame

class ThisGame: iMessageGame.Game {
    public var a: Int

    enum CodingKeys: String, CodingKey {
        case a
    }

    public init(a: Int) {
        self.a = a
        super.init()
    }

    // Constructor used to instantiate a class from JSON Data
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        a = try container.decode(Int.self, forKey: .a)
        try super.init(from: decoder)
    }

    // Method used to encode class to JSON
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(a, forKey: .a)
        try super.encode(to: encoder)
    }
}
