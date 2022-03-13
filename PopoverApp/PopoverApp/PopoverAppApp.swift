//
//  PopoverAppApp.swift
//  PopoverApp
//
//  Created by 서충원 on 2022/03/13.
//

import SwiftUI

@main
struct PopoverAppApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// menu button & popover menu
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popOver = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let menuView = MenuView()
        
        popOver.behavior = .transient
        popOver.animates = true
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        // create status bar button
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let MenuButton = statusItem?.button {
            MenuButton.image = NSImage(systemSymbolName: "icloud.and.arrow.up.fill", accessibilityDescription: nil)
            MenuButton.title = "sdfsffesfse"
            MenuButton.action = #selector(MenuButtonToggle)
        }
        
    }
    
    @objc func MenuButtonToggle() {
        if let menuButton = statusItem?.button {
            self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.maxY)
        }
    }
}
