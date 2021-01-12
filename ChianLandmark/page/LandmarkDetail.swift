//
//  LandmarkDetail.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/11.
//

import SwiftUI

struct LandmarkDetail: View {
    
    
    var landmark: chinaLandmarkModel
    @EnvironmentObject var landmarkData: LandmarkData
    
    var landmarkIndex:Int {
        landmarkData.userLandmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    
    var body: some View {
        
       
        VStack {
            
            LandmarkMapView(center: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.all)
                .frame(height: 230, alignment: .center)
                
            Image("lgd")
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(y: -130)
                .padding(.bottom , -130)
                .onTapGesture {
                    
                }

            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button(action: {
                        self.landmarkData.userLandmarks[self.landmarkIndex].isFavorite.toggle()
                    }, label: {
                        if landmarkData.userLandmarks[landmarkIndex].isFavorite {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    })
                    
                }
                
                HStack {
                    Text(landmark.category).font(.subheadline)
                    Spacer()
                    Text(landmark.city).font(.subheadline)
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing:20 ))
            
            Spacer()
        }

        
    }
}




struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: chinaLandmarks[0])
            .environmentObject(LandmarkData())
    }
}
