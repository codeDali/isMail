import SwiftUI

extension Color {
    static let brokenWhite = Color(red: 255, green: 248, blue: 240)
}

struct ContentView: View {
    @State private var hasStarted: Bool = false
    
    var body: some View {
        Group {
            if hasStarted {
                MailHomeView()
            } else {
                ZStack {
                    Image("bg")
                        .resizable()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                                startPoint: .center,
                                endPoint: .bottom
                            )
                        )
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        Text("isMail")
                            .font(.system(size: 72, weight: .black))
                            .foregroundStyle(.white)
                        
                        Text("Ready to write your message")
                            .font(.custom("CormorantGaramond-Regular", size: 16))
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                hasStarted = true
                            }
                        } label: {
                            Text("Continue")
                                .frame(maxWidth: 80)
                        }
                        .buttonStyle(.glassProminent)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 230)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
