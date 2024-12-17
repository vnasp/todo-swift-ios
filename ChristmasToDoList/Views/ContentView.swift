//
//  ContentView.swift
//  ChristmasToDoList
//
//  Created by Valentina Muñoz on 07-12-24.
//

import SwiftUI

struct ContentView: View {
    @State private var isSnowflakeVisible = true

    var body: some View {
        NavigationView {
            ZStack {
                Color.red.ignoresSafeArea()
                
                SnowComponent()
                
                Image("christmas-0")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .offset(x: 180)

                Circle()
                    .fill(Color.white)
                    .frame(width: 1000)
                    .offset(y: 450)

                VStack(spacing: 20) {
                    Image("christmas-1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                        .offset(x: -40)
                        
                    Text("AYUDANTE DE SANTA")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)

                    Text("Prepara el listado de tareas")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Spacer()
                
                    NavigationLink(destination: ListView()) {
                        Text("Ver Tareas")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 80)
                            .background(
                                LinearGradient(
                                    colors: [Color.green, Color.blue],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(30)
                    }
                }.padding(.top, 120)
            }
        }
    }
}


#Preview {
    ContentView()
}
