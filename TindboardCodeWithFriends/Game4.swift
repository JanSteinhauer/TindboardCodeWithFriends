//
//  Game4.swift
//  TindboardCodeWithFriends
//
//  Created by Jan Steinhauer on 17.10.20.
//

import SwiftUI

struct Game4: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("Tic Tac Toe")
                .preferredColorScheme(.dark)
        }
        
    }
}


struct Home: View{
    // Karten bewegen sich
    @State var moves: [String] = Array(repeating: "", count: 9)
    //um zu wissen welcher Spieler gerade dran ist
    @State var isPlaying = true
    @State var gameOver = false
    @State var msg = ""
    
    var body: some View{
        VStack{
            // Gitter Ansicht
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 15), count: 3), spacing: 15){
                ForEach(0..<9, id: \.self){ index in
                    ZStack {
                        // Flip Animation
                        Color.blue
                        Color.white
                            .opacity(moves[index] == "" ? 1 : 0)
                        
                        Text(moves[index])
                            .font(.system(size: 55))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .opacity(moves[index] == "" ? 0 : 1)
                            
                    }.frame(width: getWidth(), height: getWidth())
                    .cornerRadius(15)
                    .rotation3DEffect(
                        .init(degrees: moves[index] != "" ? 180 : 0),
                        axis: (x: 0.0, y: 1.0, z: 0.0),
                        anchor: .center,
                        anchorZ: 0.0,
                        perspective: 1.0
                    )
                    //Wenn die Karte beruerht wird
                    .onTapGesture(perform: {
                        withAnimation(Animation.easeIn(duration: 0.5)){
                            if moves[index] == ""{
                                moves[index] = isPlaying ? "X" : "0"
                                // updaten das der andere Spieler dran ist
                                isPlaying.toggle()
                            }
                            
                        }
                    })
                    
                }
                
            }
            .padding(15)
            
        }
        // immer wenn was passiert wird gecheckt
        .onChange(of: moves, perform: { value in
            checkWinner()
        })
        .alert(isPresented: $gameOver, content: {
            Alert(title: Text("Winner"), message: Text(msg), dismissButton: .destructive(Text("Play Again"), action: {
                // Alles wird auf Anfang gesetzt
                withAnimation(Animation.easeIn(duration: 0.5)){
                    moves.removeAll()
                    moves = Array(repeating: "", count: 9)
                    isPlaying = true
                }
            }))
        })
    }
    // rechenen der breite
    func getWidth() ->CGFloat{
        
        // Horizont hat man padding von je 30
        // und zw auch ein spacing von je 30
        let width = UIScreen.main.bounds.width - (30 + 30)
        
        return width / 3
    }
    // logik Gewinner
    func checkWinner(){
        if checkMoves(player: "X"){
            // Alert
            msg = "Player X Won Yeah"
            gameOver.toggle()
            print("X hat gewonnen")
        }
        if checkMoves(player: "0"){
            msg = "Player 0 Won Wuh"
            gameOver.toggle()
            print("0 hat gewonnen")
        }
    }
    func checkMoves(player: String)-> Bool{
        // schau nach Horizontalen Ereignisse
        for i in stride(from: 0, to: 9, by: 3){
            if moves[i] == player && moves[i + 1] == player && moves[i + 2] == player{
                return true
            }
            // MARK: Diagonal Metrix sometimes breaks
//            if moves[i] == player && moves[i + 4] == player && moves[i + 9] == player{
//                return true
//            }
            if moves[i] == player && moves[i + 3] == player && moves[i + 6] == player{
                return true
            }
            
        }

        return false
    }
}
