//
//  Observer.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/12/25.
//
/*
    Observer (Publisher Subsriber) Pattern
    - This way of communicating betweeen objects without tight coupling them together is called as PubSub pattern
    - This pattern allows for an object, also known as publisher to send notifications to other objects, who are listening to those changes, known as subcriber
    - one to many communication (radio show hosw (pub) to viewers(sub))
 
 NotificationCenter
 KVO-KV = Key value observer, key value coding (obsolete in a way)
 Custom Implementation
 Combine Framework
 
 *OlderWays*
 RXSwift
 RXCocoa
 */
import Foundation

extension Notification.Name {
    static let newMessage = Notification.Name("newMessage")
}

// Publisher
class ChatService {
    func sendMessage(_ message: String) {
        // Broadcast the message
        print(message)
        NotificationCenter.default.post(name: .newMessage, object: nil, userInfo: ["messageKey": message])
    }
}






















