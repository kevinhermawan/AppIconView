//
//  AppIconListItem.swift
//
//
//  Created by Kevin Hermawan on 07/10/23.
//

import SwiftUI

internal struct AppIconListItem: View {
    private var isSelected: Bool = false
    
    private let name: String
    private let imageName: String
    private let action: () -> Void
    
    internal init(_ name: String, imageName: String, action: @escaping () -> Void) {
        self.name = name
        self.imageName = imageName
        self.action = action
    }
    
    internal var body: some View {
        Button(action: action) {
            HStack {
                HStack(spacing: 16) {
                    AppIconImage(imageName)
                    
                    Text(name).tint(.primary)
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
            AppIconListItem("Default", imageName: "AppIcon-Default") {}
            
            AppIconListItem("Secondary", imageName: "AppIcon-Secondary") {}
                .selected(true)
        }
    }
}
