//
//  AppDelegate.swift
//  JenkinsiOS
//
//  Created by Robert on 23.09.16.
//  Copyright © 2016 MobiLab Solutions. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        ApplicationUserManager.manager.save()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        ApplicationUserManager.manager.save()
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if shortcutItem.type == Constants.Identifiers.favoritesShortcutItemType{
            let favoritesViewController = getViewController(name: "FavoritesViewController")
            if let nav = window?.rootViewController as? UINavigationController{
                nav.pushViewController(favoritesViewController, animated: true)
            }
        }
    }
    
    //MARK: - Helpers
    func getViewController(name: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
}

