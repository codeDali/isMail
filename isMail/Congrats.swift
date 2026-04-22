//
//  Congrats.swift
//  isMail
//
//  Created by Rizky Alpariji on 20/04/26.
//

import SwiftUI

struct Congrats: View {
    var body: some View {
        ZStack {
            Image("bg-2")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
                .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                            startPoint: .top,
                            endPoint: .top
                        )
                )
                
            VStack{
                Text("Congrats!")
                    .font(.system(size: 72, weight: .black))
                    .foregroundStyle(.white)
                
                Text("You successfully sent a mail to your future self")
                    .font(.custom("CormorantGaramond-Regular", size: 16))
                    .foregroundStyle(.white)
                    .padding(.bottom)
                
                
                NavigationLink(destination: MailHomeView()) {
                    Text("Continue")
                }
                .buttonStyle(.glassProminent)
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    Congrats()
}
