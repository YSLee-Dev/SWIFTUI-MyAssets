//
//  PageVC.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/27.
//

import SwiftUI
import UIKit

struct PageVC<Page: View> : UIViewControllerRepresentable {
    var pages : [Page]
    @Binding var currentPage : Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageVC.dataSource = context.coordinator
        pageVC.delegate = context.coordinator
        
        return pageVC
    }
    
    func updateUIViewController(_ pageVC: UIPageViewController, context: Context) {
        pageVC.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator : NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
        var parent : PageVC
        var controllers = [UIViewController]()
        
        init(_ pageVC: PageVC){
            parent = pageVC
            controllers = parent.pages.map {UIHostingController(rootView: $0)}
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {return nil}
            if index == 0{
                return controllers.last
            }
            
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {return nil}
            if index + 1 == controllers.count{
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed, let vc = pageViewController.viewControllers?.first, let index = controllers.firstIndex(of: vc){
                parent.currentPage = index
            }
        }
    }
}
