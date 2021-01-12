//
//  User.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/12.
//

import Foundation

struct User {
    
    var username: String
    var perfersNotifications = true
    var prefersSeason = Season.winter
    var birthday = Date()
    
    //键盘左上角的的符号``
    static let `default` = Self(username:"Zyf")
    
    enum Season: String, CaseIterable {
        case spring = "🌹"
        case summer = "😁"
        case autimn = "🍂"
        case winter = "❄️"

    }
    
}

