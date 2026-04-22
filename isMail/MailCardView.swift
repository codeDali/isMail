import SwiftUI

struct MailCardView: View{
    let mail: Mail
    let mode: MailCardMode
    
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .fill(.ultraThinMaterial)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color.black.opacity(0.35))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                )
        
            VStack(alignment: .leading, spacing: 14){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4){
                        Text(mail.date)
                            .font(.system(size:14, weight: .regular))
                            .foregroundColor(.white.opacity(0.8))
                        Text(mail.title)
                            .font(.system(size:24, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    trailingIcon

                        
                }
                HStack(spacing: 6){
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 11))
                    Text(mail.tag)
                        .font(.system(size: 14, weight: .medium))
                    
                }
                
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.blue)
                .clipShape(Capsule())
                
                VStack(alignment:.leading, spacing:8){
                    ProgressView(value: mail.progress)
                }
            }
            .padding(20)
            
        }
        .frame(height:170)
    }
    @ViewBuilder
    var trailingIcon: some View{
        
        switch mode{
        case .sent:
            Image(systemName: "lock.fill")
                .foregroundColor(.white)
                .font(.system(size:20))
            
        case.inbox:
            Image(systemName: "envelope.fill")
                .foregroundColor(.white)
                .font(.system(size: 20))
        }
    }
    var badgeIconName: String{
        switch mode {
        case.sent :
            return "paperplane.fill"
        case.inbox:
            return "envelope.fill"
        }
    }
    
    var badgeColor: Color {
        switch mode{
        case .sent:
            return .blue
        case .inbox:
            return .orange
        }
    }
}

#Preview {
    MailHomeView()
}

