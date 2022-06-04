//
//  CGASceneDelegate+NSToolbar.swift
//  Catalyst Grid App
//
//  Created by Steven Troughton-Smith on 07/10/2021.
//  
//

import UIKit

#if targetEnvironment(macCatalyst)
import AppKit

extension NSToolbarItem.Identifier {
	static let back = NSToolbarItem.Identifier("com.example.back")
    static let reload = NSToolbarItem.Identifier("com.example.reload")
    static let add = NSToolbarItem.Identifier("com.example.add")
//    static let close = NSToolbarItem.Identifier("com.example.close")
}

func updateTitlebarTitle(with: String, session: UISceneSession) {
    let windowScene = session.scene as! UIWindowScene
//    if runningOn == "iPad" {
//        windowScene.subtitle = with
//    } else if runningOn == "Mac" {
        windowScene.title = with
//    }
}
func updateTitlebarSubtitle(with: String, session: UISceneSession) {
    let windowScene = session.scene as! UIWindowScene
//    if runningOn == "Mac" {
        windowScene.subtitle = with
//    }
}

func updateTitleBar(withDelegate: NSToolbarDelegate, withTitle: String, withSubtitle: String, iconMode: NSToolbar.DisplayMode, sender: UIViewController, session: UISceneSession) {
    var toolbarDelegate: NSToolbarDelegate?
    toolbarDelegate = withDelegate
    
//    guard let session = sender.view.window?.windowScene?.session else { print("No session"); return }
    let windowScene = session.scene as! UIWindowScene
    
//    let windowScene = UIApplication.shared.keyWindow?.windowScene
    
    windowScene.title = withTitle
    windowScene.subtitle = withSubtitle
    
    
    let toolbar = NSToolbar(identifier: "main")
    toolbar.delegate = toolbarDelegate
    toolbar.displayMode = iconMode
    toolbar.allowsUserCustomization = false
    // Enabling this breaks the whole app
//    toolbar.autosavesConfiguration = true
    toolbar.showsBaselineSeparator = false

    if let titlebar = windowScene.titlebar {
        titlebar.toolbar = toolbar
        titlebar.toolbarStyle = .unified
//        titlebar.separatorStyle = .shadow
    }

    sender.navigationController?.isNavigationBarHidden = true
}

class WebViewToolbarDelegate: NSObject {
}

extension WebViewToolbarDelegate: NSToolbarDelegate {
    
	func toolbarItems() -> [NSToolbarItem.Identifier] {
        return [.reload, .back]
	}
	
	func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return toolbarItems()
	}
	
	func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return toolbarItems()
	}
	
	func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
		if itemIdentifier == .reload {
			
			let barItem = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise"), style: .plain, target: nil, action: NSSelectorFromString("reloadSite:"))
			
			let item = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barItem)
			
			item.label = "Reload Website"
			item.toolTip = "Reload the website."
			item.isBordered = true
			item.isNavigational = false
            item.autovalidates = false
			
			return item
		}
        
        if itemIdentifier == .back {
            
            let barItem = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: nil, action: NSSelectorFromString("goHome:"))
            
            let item = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barItem)
            
            item.label = "Go Back to Main Page"
            item.toolTip = "Go back to the main webpage."
            item.isBordered = true
            item.isNavigational = false
            item.autovalidates = false
            
            return item
        }


		
		return NSToolbarItem(itemIdentifier: itemIdentifier)
	}
}




class ScheduleToolbarDelegate: NSObject {
}

extension ScheduleToolbarDelegate: NSToolbarDelegate {
    
    func toolbarItems() -> [NSToolbarItem.Identifier] {
        return [.back]
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return toolbarItems()
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return toolbarItems()
    }
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        if itemIdentifier == .back {
            
            let barItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: nil, action: NSSelectorFromString("goBack:"))
            let item = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barItem)
            
            item.label = "Back"
            item.toolTip = "Go back"
            item.isBordered = true
            item.isNavigational = true
            item.autovalidates = false
            
            return item
        }

        
        return NSToolbarItem(itemIdentifier: itemIdentifier)
    }
}



class NoButtonsToolbarDelegate: NSObject {
}

extension NoButtonsToolbarDelegate: NSToolbarDelegate {
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        let identifiers: [NSToolbarItem.Identifier] = [
        ]
        return identifiers
    }
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return toolbarDefaultItemIdentifiers(toolbar)
    }
    func toolbar(_ toolbar: NSToolbar,
                 itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
                 willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        var toolbarItem: NSToolbarItem?
        switch itemIdentifier {
            default:
                toolbarItem = nil
        }
        return toolbarItem
    }
}


#endif

extension AppDelegate {
    
    override func buildMenu(with builder: UIMenuBuilder) {
        if builder.system == UIMenuSystem.context {
            return
        }
        
        super.buildMenu(with: builder)
        
        builder.remove(menu: .format)
        builder.remove(menu: .toolbar)
        builder.remove(menu: .newScene)
        
        /* Add 'Back' option to View menu */
        do {
            let reload = UIKeyCommand(input: "R", modifierFlags: [.command], action: NSSelectorFromString("reloadWordle:"))
            reload.title = "Reload Website"
            reload.discoverabilityTitle = "Reload the website."
            
            let reloadMenu = UIMenu(identifier: UIMenu.Identifier("ReloadWordle"), options: .displayInline, children: [reload])
            
            builder.insertChild(reloadMenu, atStartOfMenu: .view)
            
            let command = UIKeyCommand(input: "[", modifierFlags: [.command], action: NSSelectorFromString("goBack:"))
            command.title = "Go Back"
            command.discoverabilityTitle = "Go Back"
            
            let menu = UIMenu(identifier: UIMenu.Identifier("GoBack"), options: .displayInline, children: [command])
            
            builder.insertChild(menu, atStartOfMenu: .view)
            
            let settingsCommand = UIKeyCommand(input: ",", modifierFlags: [.command], action: NSSelectorFromString("openSettings:"))
            settingsCommand.title = "Settings..."
            settingsCommand.discoverabilityTitle = "Open Wordler's settings."
            
            let settingsMenu = UIMenu(identifier: UIMenu.Identifier("Settings"), options: .displayInline, children: [settingsCommand])
            
            builder.insertSibling(settingsMenu, afterMenu: .about)
        }
    }
    
}
