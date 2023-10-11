//
//  AppIconView.swift
//
//
//  Created by Kevin Hermawan on 07/10/23.
//

import AppIcon
import SwiftUI

public struct AppIconView: View {
    @State private var isErrorPresented: Bool = false
    @State private var currentAppIcon: Icon? = nil
    @State private var definedAppIcons = [Icon]()
    
    public init(current: Icon?, defined: [Icon]) {
        _currentAppIcon = State(wrappedValue: current)
        _definedAppIcons = State(wrappedValue: defined)
    }
    
    public var body: some View {
        List(definedAppIcons) { icon in
            AppIconListItem(icon.label, iconName: icon.iconName) {
                setAppIcon(to: icon)
            }
            .selected(currentAppIcon?.iconName == icon.iconName)
        }
        .alert("Unable to change the icon.", isPresented: $isErrorPresented) {}
    }
    
    private func setAppIcon(to icon: Icon) {
        AppIcon.set(to: icon) { error in
            if let _ = error {
                isErrorPresented = true
            } else {
                currentAppIcon = icon
            }
        }
    }
}

struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        let appIcons: [Icon] = [
            Icon(key: "Default", label: "Default", iconName: "AppIcon-Default", isDefault: true),
            Icon(key: "Secondary", label: "Default", iconName: "AppIcon-Secondary", isDefault: false)
        ]
        
        return NavigationView {
            AppIconView(current: appIcons.first, defined: appIcons)
                .navigationTitle("AppIconView")
        }
    }
}
