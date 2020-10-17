//
//  Game2.swift
//  TindboardCodeWithFriends
//
//  Created by Jan Steinhauer on 17.10.20.
//

import SwiftUI
import AVKit

struct Game2: View {
    @State var SongNummer: String
    @State var audioPlayer: AVAudioPlayer!
    @State var play = false
    @State var zeichen = "play.circle.fill"
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(Color(#colorLiteral(red: 0.8431372549, green: 0.7725490196, blue: 0.7294117647, alpha: 1)))
            VStack{
                Spacer()
                Image("woman")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
            Button(action:{
                if play == false{
                    self.audioPlayer.play()
                    play = true
                    zeichen = "play.circle.fill"
                }
                else{
                    self.audioPlayer.pause()
                    zeichen = "pause.circle.fill"
                    play = false
                }
                
            }){
                
                Image(systemName: zeichen).resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                
            }
        }
        
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            let sound = Bundle.main.path(forResource: SongNummer, ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        
        
    }
}


