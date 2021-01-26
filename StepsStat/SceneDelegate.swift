//
//  SceneDelegate.swift
//  StepsStat
//
//  Created by ANDREY VORONTSOV on 22.01.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        configureNavigationBar()
        
        /*
         window = UIWindow(frame: UIScreen.main.bounds)

         if let window = window {
             let view = ReposWireframe.createReposModule()
             window.rootViewController = view
             window.makeKeyAndVisible()
         }
         */
    }
    
    private func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
}

