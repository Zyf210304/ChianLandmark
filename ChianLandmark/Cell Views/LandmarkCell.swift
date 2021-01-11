//
//  LandmarkCell.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/11.
//

import SwiftUI

struct LandmarkCell: View {
    
    var landmark: chinaLandmarkModel
    
    var body: some View {
        HStack {
            Image("lgd")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(4.0)
            
            Text(landmark.name)
                .font(.title)
            
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundColor(.yellow)
            }
            
        }
    }
}

struct LandmarkCell_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkCell(landmark: chinaLandmarks[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
