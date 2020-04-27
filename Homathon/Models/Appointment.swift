//
//  Appointment.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import Foundation
import SwiftDate

class Appointment{
    var status: AppointmentStatus! = .comming
    var store: Store?
    var date: String?
    var time: String?
    var dateTime: DateInRegion?
    var isCompleted: Bool = false
    
    init(store: Store?, date:String?, time:String?){
        self.store = store
        self.date = date
        self.time = time
    }
    
    public func getDateTime()->String{
        if let d = dateTime{
            let region = Region(calendar: Calendars.gregorian, zone: Zones.asiaDubai, locale: Locales.arabicSaudiArabia)
            let now = DateInRegion(Date(), region: region)
            return d.toFormat("dd MMM yyyy  HH:mm", locale: Locales.arabicSaudiArabia)
        }
        return ""
    }
}

enum AppointmentStatus{
    case comming
    case removed
    case done
}
