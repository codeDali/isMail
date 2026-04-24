//
//  MailManager.swift
//  isMail
//
//  Created by Rizky Alpariji on 22/04/26.
//

import SwiftUI
import Observation

@Observable
class MailManager {
    var inbox: [Mail] = [
        Mail(
            unlockDate: Calendar.current.date(byAdding: .year, value: -2, to: Date.now) ?? Date.now,
            sentDate: Calendar.current.date(byAdding: .month, value: 6, to: Date.now) ?? Date.now,
            message: "Kicau",
            title: "Kicau this year",
            isLocked: true
        ),
        Mail(
            unlockDate: Calendar.current.date(byAdding: .year, value: -1, to: Date.now) ?? Date.now,
            sentDate: Calendar.current.date(byAdding: .month, value: 6, to: Date.now) ?? Date.now,
            message: "Mania",
            title: "Mania this year",
            isLocked: true
        )
    ]
    
    var sent: [Mail] = [
    ]
    
    func sendNewLetter(title: String, message: String, unlockDate: Date){
        let newMail = Mail(
            unlockDate: unlockDate,
            sentDate: Date.now,
            message: message,
            title: title,
            isLocked: true
        )
        
        sent.insert(newMail, at: 0)
    }
}
