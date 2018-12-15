//
//  TabBarController.swift
//  BoostCamp
//
//  Created by 장공의 on 15/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import UIKit
import ViewModelInterface
import Common

class TabBarController: UITabBarController  {
    
    var viewModel: MoviesRequestable?
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preloadTabItems()
    }
    
    @IBAction func sortAction(_ sender: AnyObject) {
        let title = "정렬 방식 선택"
        let message = "영화를 어떤 순서로 정렬 할까요?"
        let cancelButtonTitle = "취소"
        let advanceRateTitle = "예매율"
        let curation = "큐레이션"
        let releaseDate = "개봉일"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel))
        
        alertController.addAction(UIAlertAction(title: advanceRateTitle, style: .default) { _ in
            self.viewModel?.requestMovies(orderType: OrderType.advanceRate)
        })
        
        alertController.addAction(UIAlertAction(title: curation, style: .default) { _ in
            self.viewModel?.requestMovies(orderType: OrderType.curation)
        })
        
        alertController.addAction(UIAlertAction(title: releaseDate,style: .default) { _ in
            self.viewModel?.requestMovies(orderType: OrderType.advanceRate)
        })
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func preloadTabItems() {
        for viewController in self.viewControllers! {
            _ = viewController.view
        }
    }
    
}
