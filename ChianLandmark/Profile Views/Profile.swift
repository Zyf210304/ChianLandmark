//
//  Profile.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/12.
//

import SwiftUI

struct Profile: View {
    
    @Environment(\.editMode) var mode
    
    
    //这个页面因为用的state 修改的 所以 退出后回来 并不会出现上次修改的数据
    @State var profile = User.default
    @State var profileCopy = User.default
    
    
    var deteFormatter : DateFormatter {
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy年MM月dd日"
        return dateformatter
    }
    
    
    var body: some View {
        
        VStack() {
            
            HStack {
                Button(action: {
                    self.profile = self.profileCopy
                    self.mode?.animation().wrappedValue = .inactive
                }, label: {
                    Text("取消")
                })
                Spacer()
                EditButton()
            }
            
            
           
            if mode?.wrappedValue != .inactive {
                ProfileEdit(profile: $profile)
                    .onDisappear() {
                        self.profileCopy = self.profile
                    }
                
            } else {
                List() {
                    Text(profile.username)
                        .font(.title)
                        .bold()
                    Text("允许通知:\(profile.perfersNotifications ? "是" : "否")")
                    Text("喜欢的季节:\(profile.prefersSeason.rawValue)")
                    Text("生日:\(profile.birthday, formatter: deteFormatter)")
                    
                }
            }
            
            
            
        }
        .padding()
        .foregroundColor(.primary)
    }
}

//struct Profile_Previews: PreviewProvider {
//    static var previews: some View {
//        Profile()
//    }
//}


