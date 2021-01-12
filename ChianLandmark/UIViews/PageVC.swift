//
//  PageVC.swift
//  ChianLandmark
//
//  Created by 亚飞 on 2021/1/12.
//

import SwiftUI



struct PageVC: UIViewControllerRepresentable {
    

    let  pages = featureLandmarks.map {
        UIHostingController(rootView:
                                Image($0.imageName)
                                 .resizable()
        )
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(pages: pages)
    }
    
    func makeUIViewController(context: Context) -> some UIPageViewController {
        
        let pageVC =  UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        pageVC.dataSource = context.coordinator
        
        return pageVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
        
        uiViewController.setViewControllers(
            [pages[0]],
            direction: .forward,
            animated: true
        )
        
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        
        var pages: [UIViewController]
        
        init(pages:[UIViewController]) {
            self.pages = pages
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            let curentIndex = pages.firstIndex(of: viewController)!
            return curentIndex == 0 ? pages.last : pages[curentIndex - 1]
            
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            let curentIndex = pages.firstIndex(of: viewController)!
            return curentIndex == pages.count - 1 ?  pages.first : pages[curentIndex + 1]
            
            
        }
        
        
    }
    
    
}


struct PageVC_Previews: PreviewProvider {
    static var previews: some View {
        PageVC()
    }
}
