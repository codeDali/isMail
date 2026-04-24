import SwiftUI

struct Congrats: View {
    @Binding var selectedTab : MailTab
    @Binding var showCompose : Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 24) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.green)
                
                Text("Capsule Locked!")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Your message has been sent to the future.")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Button {
                    selectedTab = .sent
                    showCompose = false
                } label: {
                    Text("Back to Home")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                }
                .padding(.top, 40)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    Congrats(
        selectedTab: .constant(.sent),
        showCompose: .constant(true)
    )
}
