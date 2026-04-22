import SwiftUI

struct InboxView: View {
    @Binding var selectedTab: MailTab

    let inboxMails: [Mail] = [
        Mail(
            sender: "Ni'mah",
            date: "Sent 16 Apr 2026",
            message: "Birthday message",
            isRead: false,
            title: "Happy birthday Ni’mah",
            isLocked: false,
            tag: "Sent tomorrow",
            progress: 0.3
        )
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg-4")
                    .resizable()
                    .ignoresSafeArea()

                Color.black.opacity(0.12)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Inbox")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)

                        Text("Updated just now")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                    }

                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 18) {
                            ForEach(inboxMails) { mail in
                                MailCardView(mail: mail, mode: .inbox)
                            }
                        }
                        .padding(.top, 8)
                    }

                    BottomBarView(selectedTab: $selectedTab)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
#Preview {
    InboxView(selectedTab: .constant(.inbox))
}
