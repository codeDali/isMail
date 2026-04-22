//
//  Congrats.swift
//  isMail
//
//  Created by Rizky Alpariji on 20/04/26.
//

import SwiftUI

struct InboxDetail: View {
    var body: some View {
        ZStack {
            Image("bg-3")
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
                
            VStack(alignment: .leading){
                Text("Happy Birthday Ni'mah!")
                    .font(.system(size: 45, weight: .bold))
                
                HStack(spacing: 6) {
                    Image(systemName: "paperplane.fill")
                        .font(.caption)
                    
                    Text("Sent on 04 Mar 2026")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.blue, in: Capsule())
                .foregroundColor(.white)
                    
                Image("image-1")
                    .resizable()
                    .frame(width: 350, height: 300)
                    .padding()
                
                Text("Hi Ni'mah, happy birthday!")
                    .frame(width: 350)
                    .padding()
                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16))
                    
                    
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    InboxDetail()
}
