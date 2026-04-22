import SwiftUI

struct MailRow: View{
    @Binding var mail: Mail
    
    var body: some View{
        HStack (spacing: 12){
            Circle()
                .foregroundStyle(mail.isRead ? Color.clear : Color.blue)
                .frame(width:8)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 50, height: 50)
                .overlay(
                    Text("PN")
                        .foregroundColor(.white)
                        .font(.subheadline)
                )
            
            VStack{
                
                Text(mail.sender)
                    .fontWeight(.semibold)
                
                Text(mail.message)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            
            HStack
            {
                Text(mail.date)
                Image(systemName: "chevron.right.circle")
            }
            .foregroundColor(.gray)
            .font(.caption)
            
        }
        .padding(.horizontal)
    }
}



#Preview{
    MailRow(
        mail: .constant(
            Mail(
                sender: "Apple",
                date: "Today",
                message: "Blablablaba",
                isRead: false,
                title: "hola",
                isLocked: true,
                tag: "YAW",
                progress: 0.2
            )
        )
    )
}
