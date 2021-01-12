//
//  chinaLandMarkModel.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/11.
//

import SwiftUI
import CoreLocation


struct chinaLandmarkModel: Identifiable {
    var id: Int
    var category: String
    var name: String
    var city: String
    
    var latitude : Double
    var longitude : Double
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var isFavorite: Bool
    var isFeatured: Bool
}

let chinaLandmarks = [
    chinaLandmarkModel(id: 1, category: "景点", name: "天安门", city: "北京", latitude:39.915119, longitude:116.403963,  isFavorite: true, isFeatured: true),
    chinaLandmarkModel(id: 2, category: "景点", name: "东方明珠", city: "上海", latitude:31.244613, longitude:121.506046, isFavorite: false, isFeatured: true),
    chinaLandmarkModel(id: 3, category: "学校", name: "河南理工", city: "焦作", latitude:35.193959, longitude:113.274063, isFavorite: false, isFeatured: false),
    chinaLandmarkModel(id: 4, category: "家", name: "梅湾村", city: "漯河", latitude:33.692644, longitude:113.638888, isFavorite: true, isFeatured: false),
    chinaLandmarkModel(id: 5, category: "家", name: "滨江", city: "杭州", latitude:30.197604, longitude:120.196125, isFavorite: false, isFeatured: false),
    chinaLandmarkModel(id: 6, category: "学校", name: "河南五高", city: "漯河", latitude:33.593419, longitude:114.020202, isFavorite: false, isFeatured: false),
]

let featureLandmarks = chinaLandmarks.filter{$0.isFeatured}


