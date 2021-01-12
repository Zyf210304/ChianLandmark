//
//  chinaLandmarkList.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/11.
//

import SwiftUI

struct chinaLandmarkList: View {
    
    @State private var isOnlyShowFavorite = false
    @EnvironmentObject var landmarkData: LandmarkData
    
    
    var body: some View {
//        NavigationView {
            List {
                
                Toggle(isOn: $isOnlyShowFavorite, label: {
                    Text("只展示收藏")
                })
                
                ForEach(landmarkData.userLandmarks) { landmark in

                    if !self.isOnlyShowFavorite || landmark.isFavorite {
                        
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark).environmentObject(self.landmarkData)){
                                LandmarkCell(landmark: landmark)
                        }
                        
                    }
                    
                   
                }
            }
            .navigationBarTitle(Text("地标") , displayMode: .inline) ///, displayMode: .inline
//            .edgesIgnoringSafeArea(.all)
                    //隐藏包括标题和返回键在内的所有系统导航栏
//            .navigationBarHidden(true)
                    //只隐藏系统导航栏中的返回键
//            .navigationBarBackButtonHidden(true)
//            .navigationBarTitle(Text("地标"), displayMode: .inline)
            
//        }
        
    }

}



struct chinaLandmarkList_Previews: PreviewProvider {
    static var previews: some View {

            chinaLandmarkList()
                .environmentObject(LandmarkData())

    }
}
