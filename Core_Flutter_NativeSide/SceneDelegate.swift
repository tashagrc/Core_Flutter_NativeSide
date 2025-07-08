//
//  SceneDelegate.swift
//  Core_Flutter_NativeSide
//
//  Created by Natasha Radika on 05/07/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let mainVC = ViewController()
        FlutterNoteManager.shared.delegate = mainVC
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
    }
}

