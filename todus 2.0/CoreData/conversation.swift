//
//  conversation.swift
//  todus 2.0
//
//  Created by Asiel Cabrera on 9/27/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation

struct conversation: Identifiable, Encodable, Decodable {
    var id = UUID()
    var userID = UUID()
    var messages: [Message]
    
    
   static let shared = conversation(userID: UUID(),
                 messages: [
                    Message(id: UUID(),
                            message: "mensaje de prueba",
                            read: false,
                            send: true,
                            derivered: false,
                            sendAt: Date(),
                            userIDSend: UUID()
                    )
        ]
    )
}

struct Message: Identifiable, Encodable, Decodable {
    var id = UUID()
    var message: String
    var read: Bool
    var send: Bool
    var derivered: Bool
    var sendAt: Date
    var userIDSend = UUID()
    
}

struct User: Identifiable {
    var id = UUID()
}
