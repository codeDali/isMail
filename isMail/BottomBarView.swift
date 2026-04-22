import SwiftUI

struct BottomBarView: View {
    @Binding var selectedTab: MailTab
    @State private var isShowingComposerSheet = false

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
            .padding(4) // Kurangi padding luar biar nggak terlalu tebal
            .background(
                Capsule()
                    .fill(Color.black.opacity(0.45))
            )
            .overlay(
                Capsule()
                    .stroke(Color.white.opacity(0.10), lineWidth: 1)
            )

            Spacer()

            // Main Action Button (FAB)
            Button(action: {
                isShowingComposerSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .medium)) // Kecilin ikon
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60) // Standar FAB iOS
                    .background(Color.blue)
                    .clipShape(Circle())
                    // Tambahin sedikit shadow biar dia pop-up (opsional, tapi bagus buat UI)
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
            }
        }
        .padding(.horizontal, 16) // Kasih jarak aman dari tepi layar
    }

    @ViewBuilder
    func tabItem(icon: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .medium)) // Kecilin ikon

            Text(title)
                .font(.system(size: 12, weight: .semibold)) // Kecilin teks
        }
        .foregroundColor(isActive ? .blue : .white)
        .frame(width: 80, height: 52) // Proporsi yang jauh lebih rapi
        .background(isActive ? Color.white.opacity(0.05) : Color.clear)
        .clipShape(Capsule())
    }
}
