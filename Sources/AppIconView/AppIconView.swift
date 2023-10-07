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
        List(definedAppIcons, id: \.name) { icon in
            AppIconListItem(icon.name, imageName: icon.imageName) {
                setAppIcon(to: icon)
            }
            .selected(currentAppIcon?.imageName == icon.imageName)
        }
        .alert("Unable to change the icon.", isPresented: $isErrorPresented) {}
    }
    
    private func setAppIcon(to icon: Icon) {
        AppIcon.set(icon: icon) { error in
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
            Icon(name: "Default", imageName: "AppIcon-Default", isDefault: true),
            Icon(name: "Secondary", imageName: "AppIcon-Secondary", isDefault: false)
        ]
        
        return NavigationView {
            AppIconView(current: appIcons.first, defined: appIcons)
                .navigationTitle("AppIconView")
        }
    }
}
