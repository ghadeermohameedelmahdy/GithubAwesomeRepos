//
//  StringExt.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation

extension String {
    enum FormattedDate: String {
        case dateTime = "dd-MMM-yyyy h:mm a"
        case GMTFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    }
     var currentDate: Date {
        let date = Date()
        let dateFormatter = DateFormatter()
        var comp = DateComponents()
        let calendar = Calendar.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        comp.day      = Calendar.current.component(.day, from: date)
        comp.month    = Calendar.current.component(.month, from: date)
        comp.year     = Calendar.current.component(.year, from: date)
        comp.hour     = Calendar.current.component(.hour, from: date)
        comp.minute   = Calendar.current.component(.minute, from: date)
        comp.timeZone = TimeZone(abbreviation: "GMT+0:00")!
        return calendar.date(from: comp)!
    }

    func getFormattedDate(format: FormattedDate = .dateTime, localeCode: String = "en") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = FormattedDate.GMTFormat.rawValue
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 1)
        let date = dateFormatter.date(from: self) ?? currentDate
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale(identifier: localeCode)
        dateFormatter.timeZone = TimeZone.current
        let newDate = dateFormatter.string(from: date)
        return newDate
    }
}
