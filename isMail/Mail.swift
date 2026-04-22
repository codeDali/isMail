import Foundation
    
struct Mail : Identifiable{
    var id = UUID()
    var sender: String
    var date: String
    var message: String
    var isRead: Bool
    var title: String
    var isLocked: Bool
    var tag : String
    var progress: Float
    
    static var inbox: [Mail] = [
        Mail(
            sender: "Apple",
            date: "Today",
            message: "Blablablaba",
            isRead: false,
            title: "hola",
            isLocked: true,
            tag: "YAW",
            progress: 0.7
            
        ),
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
    ]
}



    
