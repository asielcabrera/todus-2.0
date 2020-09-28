//
//  DataReload.swift
//  todus 2.0
//
//  Created by Asiel Cabrera on 9/27/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class DataReload: ObservableObject {
    
    var conversations: [conversation] {
        didSet {
            self.setConversations()
            objectWillChange.send()
        }
        
    }
    var currentUserID = UUID() {
        didSet {
            objectWillChange.send()
        }
    }
    
    private var UD = UserDefaults.standard
    private var conversationKey = "com.todus.conversations"
    init() {
        self.conversations = [conversation.shared]
        self.fetchConversations()
        self.setCurrentUser()
        
    }
    func setCurrentUser() {
        
    }
    func fetchConversations() {
        // TODO: fetching conversations from userdefault
        try? self.conversations = [UD.getObjects(forKey: self.conversationKey, castTo: conversation.self)]
    }
    func setConversations() {
       try? UD.setObjects(self.conversations, forKey: self.conversationKey)
    }
}






protocol ObjectSavable {
    func setObjects<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObjects<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable

}

extension UserDefaults: ObjectSavable {
    func setObjects<Object>(_ object: Object, forKey: String) throws where Object : Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }

    func getObjects<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object : Decodable {
        guard let data = data(forKey: forKey) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()

        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }

    enum ObjectSavableError: String, LocalizedError {
        case unableToEncode = "Unable to encode object into data"
        case noValue = "No data object found for the given key"
        case unableToDecode = "Unable to decode object into given type"

        var errorDescription: String? {
            rawValue
        }
    }

}
