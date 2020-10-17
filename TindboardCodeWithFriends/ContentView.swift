//
//  ContentView.swift
//  TindboardCodeWithFriends
//
//  Created by Jan Steinhauer on 17.10.20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            /// Top  Stack
            HStack {
                Button(action: {}) {
                    Image("profile")
                }
                Spacer()
                Button(action: {}) {
                    Image("tinder-icon")
                        .resizable().aspectRatio(contentMode: .fit).frame(height:45)
                }
                
                Spacer()
                Button(action: {}) {
                    Image("chats")
                }
            }.padding([.horizontal, .bottom])
            ZStack{
//                RoundedRectangle(cornerRadius: 15)
                ForEach(Card.data.reversed()) { card in
                    CardView(card: card)
                }
            }
            .padding(8)
            
            
            .zIndex(1.0)
         
         
            HStack(spacing:0) {
                Button(action: {}) {
                    Image("refresh")
                }
                Button(action: {}) {
                    Image("dismiss")
                }
                Button(action: {}) {
                    Image("super_like")
                }
                Button(action: {}) {
                    Image("like")
                }
                Button(action: {}) {
                    Image("boost")
                }
            }
        }
    }
}

struct CardView: View {
    @State var card: Card
    //    var geometrySize: CGSize
    @State var zeigeSpiel = false

    let cardGradient = Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.5)])
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Image(card.imageName)
                .resizable()
   
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                VStack(alignment: .leading){
                    HStack {
                        Text(card.name).font(.largeTitle).fontWeight(.bold)
                        
                    }
                    Text(card.bio).font(.body)
                }
            }
            .padding()
            .foregroundColor(.white)
            
            // MARK: - Ja Nein aufzeigen
            HStack {
                Image("yes")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150)
                    // MARK: - BUG 2
                    .opacity(Double(card.x/10 - 1))
                Spacer()
                Image("nope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150)
                    
                    .opacity(Double(card.x/10 * -1 - 1))
            }
            
            
        }
        // MARK: logic welches Game gezeigt wird
        .sheet(isPresented: $zeigeSpiel, content: {
            if card.age == 1 {
                Game1()
            }
            if card.age == 2 {
                Game2(SongNummer: "song11")
            }
            if card.age == 3{
                Game3()
            }
            if card.age == 4{
                Game2(SongNummer: "song12")
            }
            if card.age == 5{
                Game4()
            }
            if card.age == 6{
                Game2(SongNummer: "song13")
            }
            else{
                
            }
           
        })
        
        .cornerRadius(8)
       
        .offset(x: card.x, y: card.y)
        .rotationEffect(.init(degrees: card.degree))
        .gesture (
            DragGesture()
                .onChanged { value in
                    withAnimation(.default) {
                        print("x:", value.translation.width)
                        print("y:", value.translation.height)
                        card.x = value.translation.width
                        
                        card.y = value.translation.height
                        card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                    }
                }// MARK: - Logik wie sich die Karten entscheiden
                .onEnded { (value) in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                        case 0...100:
                            card.x = 0; card.degree = 0; card.y = 0
                        case let x where x > 100:
                            card.x = 500; card.degree = 12
                            zeigeSpiel.toggle()
                        case (-100)...(-1):
                            card.x = 0; card.degree = 0; card.y = 0
                        case let x where x < -100:
                            card.x  = -500; card.degree = -12
                        default:
                            card.x = 0; card.y = 0
                        }
                    }
                }
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}


