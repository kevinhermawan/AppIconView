//
//  AppIconView.swift
//
//
//  Created by Kevin Hermawan on 07/10/23.
//

import AppIcon
import SwiftUI

public struct AppIconView: View {
    @Binding private var currentAppIcon: Icon?
    
    @State private var isErrorPresented: Bool = false
    @State private var definedAppIcons = [Icon]()
    
    public init(current: Binding<Icon?>, defined: [Icon]) {
        _currentAppIcon = Binding(projectedValue: current)
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
            Icon(label: "Default", iconName: "AppIcon-Default", isDefault: true),
            Icon(label: "Default", iconName: "AppIcon-Secondary", isDefault: false)
        ]
        
        return NavigationView {
            AppIconView(current: .constant(AppIcon.current), defined: appIcons)
                .navigationTitle("AppIconView")
        }
    }
}
