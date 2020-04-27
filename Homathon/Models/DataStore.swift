//
//  DataStore.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import Foundation
import SwiftDate

class DataStore{
    static var appointments = [Appointment]()
    
    static var stores = [
        Store(id: 1,name: "بنده", image: #imageLiteral(resourceName: "banda"), status: .normal, distance: "٤٠ شخص", times: "٦ص - ٣م", capacity: "٥٠ شخص"),
        
        Store(id: 2,name: "البنك الأهلي", image: #imageLiteral(resourceName: "ahli"), status: .normal, distance: "٢ كم", times: "٦ص - ٣م", capacity: "٢٠ شخص"),
        
        Store(id: 3,name: "سوق الخضار", image: #imageLiteral(resourceName: "veg"), status: .normal, distance: "٤ كم", times: "٦ص - ٣م", capacity: "٦٠ شخص"),
        
        Store(id: 4,name: "ميد", image: #imageLiteral(resourceName: "meed"), status: .normal, distance: "٧ كم", times: "٦ص - ٣م", capacity: "٥ شخص"),
        
        Store(id: 5,name: "أسواق التميمي", image: #imageLiteral(resourceName: "tamimi-1"), status: .normal, distance: "٩ كم", times: "٦ص - ٣م", capacity: "٥٠ شخص"),
        
        Store(id: 6,name: "أسواق العثيم", image: #imageLiteral(resourceName: "othaim"), status: .normal, distance: "٢ كم", times: "٦ص - ٣م", capacity: "٣٠ شخص"),
        
        Store(id: 7,name: "السدحان", image: #imageLiteral(resourceName: "sadhan"), status: .normal, distance: " ٣ كم", times: "٦ص - ٣م", capacity: "٤٠ شخص"),
        
        Store(id: 8,name: "لولو ماركت", image: #imageLiteral(resourceName: "lolo"), status: .normal, distance: "٢ كم", times: "٦ص - ٣م", capacity: "٧٠ شخص"),
        
        Store(id: 9,name: "بنك الراجحي", image: #imageLiteral(resourceName: "rajhi"), status: .normal, distance: "٨ كم", times: "٦ص - ٣م", capacity: "١٥ شخص"),
        
        Store(id: 9,name: "STC", image: #imageLiteral(resourceName: "stc"), status: .normal, distance: "٨ كم", times: "٦ص - ٣م", capacity: "١٥ شخص"),
    ]
    
    static public func addAppointmentForStore(store: Store, date: String, time: String, dateObject: Date, timeObject: Date) -> Bool{
        let added = appointments.contains(where: { (app) -> Bool in
            app.store?.id == store.id
        })
        
        if added {
            return false
        }
        store.reserved = true
        
        // set datetime:
        let region = Region(calendar: Calendars.gregorian, zone: Zones.asiaRiyadh, locale: Locales.arabicSaudiArabia)
        let dateTime = DateInRegion(year: dateObject.year, month: dateObject.month, day: dateObject.day, hour: timeObject.hour, minute: timeObject.minute, second: timeObject.second, nanosecond: timeObject.nanosecond, region: region)
        print(dateTime.toString())
        print(dateObject.toString())
        print(timeObject.toString())
        
        let newApp = Appointment(store: store, date: date, time: time)
        newApp.dateTime = dateTime
        appointments.append(newApp)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "appointmentAdded"), object: nil)
        return true
    }
    
    static public func getMinutesUntilAppointment(appoint: Appointment) -> TimeInterval{
        let region = Region(calendar: Calendars.gregorian, zone: Zones.asiaRiyadh, locale: Locales.arabicSaudiArabia)
        let now = DateInRegion(Date(), region: region)
        let appDate = appoint.dateTime! + 3.hours // to resolve grinich
        
        print("/////////")
        print(appDate.convertTo(calendar: Calendars.gregorian, timezone: Zones.asiaRiyadh, locale: Locales.arabicSaudiArabia).toString())
        print(appDate.toString())
        print(now.toString())
        
        let intervalMinutes = now.getInterval(toDate: appDate, component: .second)
        print(intervalMinutes)
        return TimeInterval(intervalMinutes)
    }
    
    static public func getNextAppointment() -> Appointment?{
        var apps = DataStore.appointments
        apps.sort { (first, second) in
            return first.dateTime!.isBeforeDate(second.dateTime!, orEqual: false, granularity: .second)
        }
        return apps.first
    }
}
