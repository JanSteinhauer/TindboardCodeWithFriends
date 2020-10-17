//
//  Motivation.swift
//  Motivation
//
//  Created by Jan Steinhauer on 17.10.20.
//


import WidgetKit
import SwiftUI


struct HelloWorldEntry: TimelineEntry {
    var date: Date = Date()
    // Date muss immer mit dabei sein
    let message: String
    // hier kommen die daten hin auf die das Widget zugriff hat
}
struct Provider: TimelineProvider{

    typealias Entry = HelloWorldEntry
    // wo kommt die Daten her
    func placeholder(in context: Context) -> HelloWorldEntry {
       return HelloWorldEntry(message: "Hello World")
    }

    func getSnapshot(in context: Context, completion: @escaping (HelloWorldEntry) -> Void) {
        completion(HelloWorldEntry(message: "hello World"))

    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<HelloWorldEntry>) -> Void) {
        // dafuer zustaendig wie oft etwas geupdated wird
        let entry = HelloWorldEntry(message: "Hello World")
        completion(Timeline(entries: [entry], policy: .never))
        // in den fall wird sich das Widget nicht aendern
    }






    }


struct HelloWorldView: View {
   
    let entry : Provider.Entry
    var body: some View{
        WidgetAnsicht()
    }
}
@main
struct HelloWorldWidget: Widget {
    // das ist der Name des Widgets
    private let kind = "HelloWorld-Widget"

    var body: some WidgetConfiguration{
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            HelloWorldView(entry: entry)
        }.supportedFamilies([.systemMedium])
        // sagt wie gross ein Widget ist


    }
}




struct WidgetAnsicht: View {
    var body: some View {
        ZStack{

            VStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.yellow)
                    .background(Color.yellow)
                    .offset(y: -20)

                VStack{
                    Spacer()
                    Text("🔥 Start your passion 🔥")
                        .fontWeight(.semibold)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .offset(y: -10)
                    Spacer()
                }
            }
        }.background(
            LinearGradient(gradient: Gradient(colors: [.black, Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))]), startPoint: .top, endPoint: .bottom))

    }
}


