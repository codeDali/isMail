import SwiftUI

struct SentView: View {
    @Binding var selectedTab: MailTab
    @State private var isShowingComposerSheet = false
    var manager: MailManager

    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg-1")
                    .resizable()
                    .ignoresSafeArea()
                
                Color.black.opacity(0.12)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Sent")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(manager.sent.isEmpty ? "No letters sent yet" : "Updated just now")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    
                    if manager.sent.isEmpty{
                        VStack(spacing: 16) {
                            Spacer()
                            Image(systemName: "paperplane")
                                .font(.system(size: 48))
                                .foregroundColor(.white.opacity(0.5))
                            Text("Your time capsule is empty.")
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.7))
                            Text("Tap the plus button to send a letter to the future.")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.5))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                            Spacer()
                        }
                    } else {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 18) {
                                ForEach(manager.sent) { mail in
                                    MailCardView(mail: mail, mode: .sent)
                                }
                            }
                            .padding(.top, 8)
                        }
                    }
                    
                    
                    
                    BottomBarView(
                        selectedTab: $selectedTab,
                        onAddTapped:{
                            isShowingComposerSheet = true
                        } ).padding(.bottom, 12)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }
            .toolbar(.hidden, for: .navigationBar)
    
            }
        .sheet(isPresented: $isShowingComposerSheet){
            ComposeView(selectedTab: $selectedTab,
                        showCompose: $isShowingComposerSheet,
                        manager: manager)
        }
    }
}


#Preview {
    SentView(
        selectedTab: .constant(.sent),
        manager: MailManager()
    )
}
