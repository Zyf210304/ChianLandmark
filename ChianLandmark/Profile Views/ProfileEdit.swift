//
//  ProfileEdit.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/12.
//

import SwiftUI


struct ProfileEdit: View {
    
    @Binding var profile: User
    
    var body: some View {
        List(){
            
            HStack {
                Text("昵称")
                Divider()
                TextField("昵称", text:$profile.username)
            }
            Toggle(isOn: $profile.perfersNotifications) {
                Text("允许通知")
            }
            VStack(alignment: .leading) {
                Text("喜欢的季节")
                
                Picker("喜欢的季节",selection: $profile.prefersSeason) {
                    ForEach(User.Season.allCases, id:\.self) {
                        season in
                        Text(season.rawValue).tag(season)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            VStack(alignment: .leading) {
                DatePicker("生日", selection: $profile.birthday, displayedComponents: .date)
            }
            
        }
    }
}
//struct ProfileEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEdit()
//    }
//}
