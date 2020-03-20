//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Omar on 18.03.2020.
//  Copyright © 2020 omarmin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CityWeatherForecastAssembly.assemble()
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
