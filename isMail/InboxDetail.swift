//
//  InboxDetail.swift
//  isMail
//
//  Created by Rizky Alpariji on 20/04/26.
//



import SwiftUI

struct InboxDetail: View {
    let mail: Mail
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(mail.title)
                        .font(.system(size: 42, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .padding(.top, 16)
                
                Divider()
                    .background(Color.white.opacity(0.3))
                
                Text(mail.message)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(8)
                
                Spacer(minLength: 80)
            }
            .padding(.horizontal, 24)
        }
        .background {
            Image("bg-3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.8), .clear, .black.opacity(0.9)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    InboxDetail(
        mail: Mail(
            unlockDate: Date(),
            sentDate: Calendar.current.date(byAdding: .year, value: -1, to: Date()) ?? Date(),
            message: "Hi Ni'mah, happy birthday! This is a dynamic message injected from the Mail object. Notice how the layout perfectly adapts to longer texts because we implemented a ScrollView and dynamic typographies. Stay awesome and keep learning those basic first principles!",
            title: "Happy Birthday Ni'mah!",
            isLocked: false
        )
    )
}
