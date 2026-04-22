import SwiftUI

struct SentView: View {
    @Binding var selectedTab: MailTab
    @State var mails: [Mail] = Mail.inbox

    let dummyMails: [Mail] = [
        Mail(sender: "Apple", date: "Today", message: "Your order has been shipped", isRead: false, title: "Order Update", isLocked: true, tag: "Sent on 24 Mar 2026", progress: 0.2),
        Mail(sender: "Netflix", date: "Yesterday", message: "New episode available", isRead: true, title: "Series Update", isLocked: false, tag: "Sent on 12 Mar 2026", progress: 0.4),
        Mail(sender: "Shopee", date: "Today", message: "Flash sale is live!", isRead: false, title: "Promo", isLocked: false, tag: "Shopping", progress: 0.2),
        Mail(sender: "Shopee", date: "Today", message: "Flash sale is live!", isRead: false, title: "Promo", isLocked: false, tag: "Shopping", progress: 0.2)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg-1")
                    .resizable()
                    .ignoresSafeArea()

                Color.black.opacity(0.20)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Sent")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)

                        Text("Updated just now")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.85))
                    }

                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 18) {
                            ForEach($mails) { $mail in
                                MailCardView(mail: mail, mode: .sent)
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
    SentView(selectedTab: .constant(.sent))
}
