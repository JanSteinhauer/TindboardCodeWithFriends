//
//  Game1.swift
//  TindboardCodeWithFriends
//
//  Created by Jan Steinhauer on 17.10.20.
//

import SwiftUI

struct Game1: View {
    @State private var randNum1 = 1
    @State private var randNum2 = 1
    @State private var Gewinnertext = ""
    var body: some View {
        ZStack{
            Image("Background")
            VStack{
                Spacer()
                Image("logo")
                    .offset(y: 40)
                Spacer()
                HStack{
                    Image("card"+String(randNum1))
                    Image("card"+String(randNum2))
                }
                Text(Gewinnertext)
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    
                Spacer()
                Button(action: {
                    self.shouffle()
                    
                }) {
                    Text("Deal")
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(20)
                        .offset(y: -50)
                        .padding(.top, 50)
                        
                    
                }
                Spacer()
                
            }
        }
    }
    func shouffle(){
        self.Gewinnertext = ""
        self.randNum1 = Int.random(in: 2...14)
        self.randNum2 = Int.random(in: 2...14)
        
        if randNum2 == randNum1{
            self.Gewinnertext = "Du hast Gewonnen"
        }
    }
}

struct Game1_Previews: PreviewProvider {
    static var previews: some View {
        Game1()
    }
}
