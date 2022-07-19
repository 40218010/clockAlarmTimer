//
//  AlarmModel.swift
//  clockApp
//
//  Created by 林大屍 on 2022/4/28.
//

import Foundation



struct AlarmModel: Identifiable {
    
    var id: String = UUID().uuidString
    var time: Date = Date()
    var selectedDays = Set<Day>()
    var alarmTag: String = "鬧鐘"
    
    
    
    
    //MARK: - day picker
    
    var repeatText: String {
        switch selectedDays {
        case []:
            return "永不"
        case Set(Day.allCases):
            return "每天"
        case [.mon, .tues, .wed, .thur, .fri]:
            return "平日"
        case [.sat, .sun]:
            return "週末"
        default:
            
            let dayText = selectedDays
                .sorted(by: { $0.rawValue < $1.rawValue })
                .map {
                    let str = $0.dayString
                    if selectedDays.count > 1 {
                        return str.replacingOccurrences(of: "星期", with: "週")
                    }
                    return str
                }
                .joined(separator: ", ")
        
            return dayText
            
        }
    }
    
    
    var timeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: time)
    }
    
    var alarmSubtitle: String {
        if selectedDays.isEmpty {
            return alarmTag
        } else {
            return alarmTag + "，" + repeatText
        }
    }
    
    
}

enum Day: Int, CaseIterable {
    case mon = 1
    case tues = 2
    case wed = 3
    case thur = 4
    case fri = 5
    case sat = 6
    case sun = 7
    
    var dayString: String {
        switch self {
        case .mon:
            return "星期一"
        case .tues:
            return "星期二"
        case .wed:
            return "星期三"
        case .thur:
            return "星期四"
        case .fri:
            return "星期五"
        case .sat:
            return "星期六"
        case .sun:
            return "星期日"
        }
    }
    
}




