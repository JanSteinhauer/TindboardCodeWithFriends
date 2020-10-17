//
//  Card.swift
//  TindboardCodeWithFriends
//
//  Created by Jan Steinhauer on 17.10.20.
//

import UIKit


//MARK: - DATA
struct Card: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let age: Int
    let bio: String
    /// Card x position
    var x: CGFloat = 0.0
    /// Card y position
    var y: CGFloat = 0.0
    /// Card rotation angle
    var degree: Double = 0.0
    
    static var data: [Card] {
        [
            Card(name: "Wargame", imageName: "Game1", age: 1, bio: "J'aime la vie et le vin 🍷"),
            Card(name: "Jan", imageName: "Game3", age: 2, bio: "Insta ~ stei.jan"),
            Card(name: "Mayuko", imageName: "Game2", age: 3, bio: "hi, let's be friends"),
            Card(name: "Jan", imageName: "Game4", age: 4, bio: "Insta ~ stei.jan"),
            Card(name: "Tic Tac Toe", imageName: "Game6", age: 5, bio: "Hello World"),
            Card(name: "Jan", imageName: "Game5", age: 6, bio: "Insta ~ stei.jan"),
//            Card(name: "Arianne", imageName: "p6", age: 23, bio: "🇬🇧 22, uni of Notts"),
//            Card(name: "Sam", imageName: "p7", age: 22, bio: "S.Wales / Oxford 📚"),
        ]
    }
    
}
