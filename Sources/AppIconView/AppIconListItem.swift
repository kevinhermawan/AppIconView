//
//  AppIconListItem.swift
//
//
//  Created by Kevin Hermawan on 07/10/23.
//

import SwiftUI

internal struct AppIconListItem: View {
    private var isSelected: Bool = false
    
    private let label: String
    private let iconName: String
    private let action: () -> Void
    
    internal init(_ name: String, iconName: String, action: @escaping () -> Void) {
        self.label = name
        self.iconName = iconName
        self.action = action
    }
    
    internal var body: some View {
        Button(action: action) {
            HStack {
                HStack(spacing: 16) {
                    AppIconImage(iconName)
                    
                    Text(label).tint(.primary)
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .tint(.accentColor)
                }
            }
        }
    }
    
    internal func selected(_ selected: Bool) -> AppIconListItem {
        var view = self
        view.isSelected = selected
        
        return view
    }
}

struct AppIconListItem_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            AppIconListItem("Default", iconName: "AppIcon-Default") {}
            
            AppIconListItem("Secondary", iconName: "AppIcon-Secondary") {}
                .selected(true)
        }
    }
}
