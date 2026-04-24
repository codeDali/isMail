import SwiftUI

struct BottomBarView: View {
    @Binding var selectedTab: MailTab
    @State private var isShowingComposerSheet = false

    var onAddTapped: () -> Void
    
    var body: some View {
        HStack {
            // Tab Segmented Control
            HStack(spacing: 0) {
                Button {
                    selectedTab = .sent
                } label: {
                    tabItem(
                        icon: "paperplane.fill",
                        title: "Sent",
                        isActive: selectedTab == .sent
                    )
                }

                Button {
                    selectedTab = .inbox
                } label: {
                    tabItem(
                        icon: "tray.fill",
                        title: "Inbox",
                        isActive: selectedTab == .inbox
                    )
                }
            }
            .padding(4)
            .background(
                Capsule()
                    .fill(Color.black.opacity(0.45))
            )
            .overlay(
                Capsule()
                    .stroke(Color.white.opacity(0.10), lineWidth: 1)
            )

            Spacer()

            
            Button(action: {
                onAddTapped()
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
            }
        }
    
    }

    @ViewBuilder
    func tabItem(icon: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .medium))

            Text(title)
                .font(.system(size: 12, weight: .semibold))
        }
        .foregroundColor(isActive ? .blue : .white)
        .frame(width: 80, height: 52)
        .background(isActive ? Color.white.opacity(0.05) : Color.clear)
        .clipShape(Capsule())
    }
}
