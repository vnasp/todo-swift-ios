//
//  SnowComponent.swift
//  ChristmasToDoList
//
//  Created by Valentina Muñoz on 07-12-24.
//

import SwiftUI

struct SnowComponent: View {
    @State private var startAnimation = false

    var body: some View {
        ZStack {
            // Copo 1
            Image(systemName: "snowflake")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .offset(x: -UIScreen.main.bounds.width / 4, y: startAnimation ? UIScreen.main.bounds.height / 14 : -UIScreen.main.bounds.height / 2)
                .opacity(startAnimation ? 0.3 : 1.0)
                .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: false), value: startAnimation)

            // Copo 2
            Image(systemName: "snowflake")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .offset(x: UIScreen.main.bounds.width / 6, y: startAnimation ? UIScreen.main.bounds.height / 16 : -UIScreen.main.bounds.height / 1.5)
                .opacity(startAnimation ? 0.1 : 1.0)
                .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: false), value: startAnimation)

            // Copo 3
            Image(systemName: "snowflake")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
                .offset(x: UIScreen.main.bounds.width / 3.5, y: startAnimation ? UIScreen.main.bounds.height / 18 : -UIScreen.main.bounds.height / 1)
                .opacity(startAnimation ? 0.5 : 1.0)
                .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: false), value: startAnimation)
        }
        .onAppear {
            startAnimation = true
        }
    }
}

#Preview {
    ZStack {
        Color.teal.ignoresSafeArea()
        SnowComponent()
    }
}
