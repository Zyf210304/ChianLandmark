//
//  Home.swift
//  ChianLandmark
//
//  Created by 张亚飞 on 2021/1/11.
//

import SwiftUI

struct Home: View {
    
    var categories :[String: [chinaLandmarkModel]] {
        Dictionary(
            grouping: chinaLandmarks,
            by: {$0.category}
        )
    }
    
    @State private var isPresented = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                Image("lgd")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { categoryName in
                    
                    CategoryCell(categoryName: categoryName, landmarks: self.categories[categoryName]!)
                    
                }.listRowInsets(EdgeInsets())
                
                
                NavigationLink(
                    destination: chinaLandmarkList()) {
                    Text("查看全部").font(.subheadline)
                }
            }
            .navigationBarTitle(Text("精选"))
            .navigationBarItems(trailing:
                                    
                                    Button(action: {
                                        self.isPresented = true
                                    }, label: {
                                        Image(systemName: "person.circle.fill")
                                        .font(.title)
                                        .foregroundColor(.blue)
                                        .sheet(isPresented: $isPresented, content: {
                                            Text("1231231\n\n\n\n\n\nn\n123123")
                                        })
                                    })
                                
                                    
                                
            )
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

