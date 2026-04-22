//
//  ContentView.swift
//  isMail
//
//  Created by Rizky Alpariji on 17/04/26.
//

import SwiftUI

extension Color {
    static let brokenWhite = Color(red: 255, green: 248, blue: 240)
}


struct ContentView: View {
    @State private var navigateToHome: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                    )
                
                VStack(alignment: .leading){
                    Spacer()
                    Text("isMail")
                        .font(.system(size: 72, weight: .black))
                        .foregroundStyle(.white)
                    
                    Text("Ready to write blablabla")
                        .font(.custom("CormorantGaramond-Regular", size: 16))
                        .foregroundStyle(.white)
                        .padding(.bottom)
                    
                    
                    NavigationLink(destination: MailHomeView()) {
                        Text("Continue")
                    }
                    .buttonStyle(.glassProminent)
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 30).padding(.bottom, 230)
                
                
            }
        }.navigationDestination(isPresented: $navigateToHome) {
            MailHomeView()
        }
        
    }
}

#Preview {
    ContentView()
}
