//
//  Message.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 05.02.2023.
//

import Foundation

struct Message: Identifiable, Codable{
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
