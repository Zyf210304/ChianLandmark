//
//  LandmarkMapView.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/11.
//

import SwiftUI
import MapKit

struct LandmarkMapView: UIViewRepresentable {
    
    let center : CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
         MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        uiView.setRegion(MKCoordinateRegion(center: self.center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: true)
        
    }
}

struct LandmarkMapView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkMapView(center: chinaLandmarks[0].locationCoordinate)
    }
}
