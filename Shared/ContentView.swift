//
//  ContentView.swift
//  Shared
//
//  Created by 孙一峰 on 2021/1/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            GradientCard().padding(.init(top: -100, leading: -100, bottom: 0, trailing: 0))
            GradientCard()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GradientCard: View {
    @State var warm = true
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 4.0) {
                Text("GradientCard")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .opacity(0.8)
                    .foregroundColor(.white)
                Text(warm ? "From purple to red." : "From purple to blue.")
                    .font(.body)
                    .opacity(0.4)
            }.frame(width: 300, height: 100)
            Button(action:{
                withAnimation{
                    warm.toggle()
                    print("toggling skin")
                }
            }) {
                Text(warm ? "Change to cold" : "Change to warm")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .foregroundColor(.purple)
            }.padding()
        }
        .padding()
        .background(warm ? LinearGradient(gradient: Gradient(
                                            colors: [.red, .purple]),
                                          startPoint: .topLeading,
                                          endPoint: .bottomTrailing) :
                        LinearGradient(gradient: Gradient(
                                        colors: [.purple, .blue]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
        .cornerRadius(20)
        .opacity(warm ? 0.5 : 1)
    }
}
