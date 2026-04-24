import SwiftUI

struct MailHomeView: View {
    @State private var manager = MailManager()
    @State private var selectedTab: MailTab = .sent

    var body: some View {
        Group {
            switch selectedTab {
            case .sent:
                SentView(selectedTab: $selectedTab, manager: manager)
            case .inbox:
                InboxView(selectedTab: $selectedTab, manager: manager)
            }
        }
    }
}

#Preview {
    MailHomeView()
}
