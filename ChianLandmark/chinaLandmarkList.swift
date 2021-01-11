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
        NavigationView {
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
            .navigationTitle(Text("地标"))
            
        }
        
    }

}



struct chinaLandmarkList_Previews: PreviewProvider {
    static var previews: some View {

            chinaLandmarkList()
                .environmentObject(LandmarkData())

    }
}
