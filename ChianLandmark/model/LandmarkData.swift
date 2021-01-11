//
//  LandmarkData.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/11.
//

import SwiftUI
import Combine

//BindableObject由Combine框架中的ObservableObject协议替换。
final class LandmarkData: ObservableObject{

    var didChange = PassthroughSubject<LandmarkData, Never>()
    
    @Published var userLandmarks = chinaLandmarks {
        didSet{
            didChange.send(self)
        }
    }
    
    
}

