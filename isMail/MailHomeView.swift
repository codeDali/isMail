import SwiftUI

struct MailHomeView: View {
    @State private var selectedTab: MailTab = .sent

    var body: some View {
        Group {
            switch selectedTab {
            case .sent:
                SentView(selectedTab: $selectedTab)
            case .inbox:
                InboxView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    MailHomeView()
}
