//
//  RootManager.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 5.10.2023.
//

import Foundation
import UIKit
class RootManager {
    
    static let shared: RootManager = {
        let instance = RootManager()
        return instance
    }()
    
    init(){}
    
    static func switchRoot(_ type: PageType,sender: Any? = nil) {
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let delegate = windowScene.delegate as? SceneDelegate
            else { return }
            let vc = type.getSelectedVC(sender: sender)
            delegate.window?.rootViewController = vc
            UIView.transition(with: delegate.window!,
                              duration: 0,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
    }
}

enum PageType {
    case splash
    case tabBar
    
    func getSelectedVC(sender: Any? = nil) -> UIViewController {
        switch self {
        case .splash: return UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "SplashController")
        case .tabBar:
            let tabBarVC = UIStoryboard(name: "MainTab", bundle: nil).instantiateViewController(withIdentifier: "MainTabController") as! UITabBarController
            if let navController = tabBarVC.viewControllers?.first as? UINavigationController,
               let homeController = navController.viewControllers.first as? HomeController{ }
//                           let messages = sender as? [MessagesCellItem] {
//                            messagesController.viewModel.messages = messages
//            { }
            return tabBarVC
        }
    }
}
