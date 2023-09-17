//
//  SplashView.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/17/23.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            LottieView(lottieFile: "animation_splash", isLooped: true)
            Spacer()
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                coordinator.push(page: .planets)
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(Coordinator())
    }
}
