//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport


struct ContentView: View {
    var body: some View {
        Text("Hello, World!").font(.largeTitle).padding().animation(Animation.easeInOut(duration: 2).repeatForever())
        Text("This is a playground").foregroundColor(.red)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
