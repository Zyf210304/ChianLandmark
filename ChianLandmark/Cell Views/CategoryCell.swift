//
//  CategoryCell.swift
//  ChianLandmark
//
//  Created by 张亚飞 on 2021/1/11.
//

import SwiftUI



struct CategoryCell: View {
    
    var categoryName: String
    var landmarks: [chinaLandmarkModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
            
            ScrollView (.horizontal, showsIndicators: false){
                
                categoryScrollCell(landmarks: self.landmarks)
                
            }
        }
        .padding(.leading, 15)
        .padding([.top, .bottom], 8)
    }
}

struct categoryScrollCell: View {
    
    var landmarks : [chinaLandmarkModel]
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            ForEach(landmarks) { landmark in
                
                NavigationLink(
                    destination: LandmarkDetail(landmark: landmark)) {
                    VStack(alignment: .leading) {
                        Image("lgd")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 155, height: 155)
                            .scaledToFill()
                            .cornerRadius(5.0)
                            
                        Text(landmark.name)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }

            }
            
        }
    }
}
