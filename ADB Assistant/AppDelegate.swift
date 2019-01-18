//
//  AppDelegate.swift
//  ADB Assistant
//
//  Created by Michael Ovchinnikov on 25/11/2018.
//  Copyright © 2018 Michael Ovchinnikov. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_: Notification) {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let window = storyboard.instantiateController(withIdentifier: "MainWindow") as! NSWindowController
        let mainViewController = storyboard.instantiateController(withIdentifier: "MainViewController") as! NSViewController
        let settingsViewController = storyboard.instantiateController(withIdentifier: "SettingsViewController") as! NSViewController

        let defaults = ServiceLocator.shared.defaults
        let platformToolsPath = defaults.string(forKey: .platformToolsPath)
        if platformToolsPath != nil {
            window.contentViewController = mainViewController
        } else {
            window.contentViewController = settingsViewController
        }

        window.showWindow(self)
    }
}
