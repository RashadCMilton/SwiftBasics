//
//  AppDelegate.swift
//  LoginScreen
//
//  Created by Rashad Milton on 2/13/25.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Manually set Google Client ID (from Google Cloud Console)
        let clientID = "803086645942-fmsma9eljmhcbcjqmc2rhb0aftk2lr4j.apps.googleusercontent.com"
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
        
        // Restore Previous Sign-In State
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let user = user {
                print("User is already signed in: \(user.profile?.name ?? "No user")")
            } else if let error = error {
                print("Error restoring sign in: \(error.localizedDescription)")
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // Handle Google Sign-In Redirects
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}
