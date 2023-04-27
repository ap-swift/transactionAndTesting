//
//  AppDelegate.swift
//  CheckTransactions
//
//  Created by Artem Parfenov on 22.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        launch()

        return true
    }

    func launch() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationRootController = UINavigationController(rootViewController: FirstViewController())
        window?.rootViewController = navigationRootController
        window?.makeKeyAndVisible()
    }


}

