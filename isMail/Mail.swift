import Foundation
    
struct Mail : Identifiable, Hashable, Codable{
    var id = UUID()
    var unlockDate: Date
    var sentDate : Date
    var message: String
    var title: String
    var isLocked: Bool
    var progress: Float {
        let duration = unlockDate.timeIntervalSince(sentDate)
        let timepassed = Date.now.timeIntervalSince(sentDate)
        
        if duration <= 0 {
            return 1.0
        }
        
        let currentProgress = Float(timepassed / duration)
        return min(max(currentProgress, 0.0), 1.0)
    }
    
    init(id: UUID = UUID(), unlockDate: Date, sentDate: Date, message: String, title: String, isLocked: Bool) {
            self.id = id
            self.sentDate = sentDate
            self.unlockDate = unlockDate
            self.message = message
            self.title = title
            self.isLocked = isLocked
        }
    
    static var inbox: [Mail] = []
}



    
