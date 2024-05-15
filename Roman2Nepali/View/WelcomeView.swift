//
//  WelcomeView.swift
//  Roman2Nepali
//
//  Created by Kesh Gurung on 25/04/2024.
//

import SwiftUI

struct WelcomeView: View {
    @State var scaleImage = false
    @State var isActive = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Image("welcome")
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .scaleEffect(scaleImage ? 1.02 : 1)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1).repeatForever()){
                        scaleImage.toggle()
                    }
                    
                    // Setting timer for transition
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        self.isActive = true
                    }
                }
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $isActive){
                HomeView(viewModel: RomanToNepaliViewModel())
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    WelcomeView()
}
