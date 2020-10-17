//
//  Game3.swift
//  TindboardCodeWithFriends
//
//  Created by Jan Steinhauer on 17.10.20.
//

import SwiftUI
import AVKit

struct Game3: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=rqX8PFcOpxA")!))
    }
}

struct Game3_Previews: PreviewProvider {
    static var previews: some View {
        Game3()
    }
}
