//
//  Date.swift
//  TaskIt
//
//  Created by Miroslaw Kucharzyk on 03/01/16.
//  Copyright © 2016 Miroslaw Kucharzyk. All rights reserved.
//

import Foundation

class Date {
    class func from(year year: Int, month: Int, day: Int) -> NSDate {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        let gregorianCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        
        let date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
    }
    
    class func toString(date:NSDate) -> String {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateStringFormatter.stringFromDate(date)
    }
}