//
//  AppIconImage.swift
//
//
//  Created by Kevin Hermawan on 07/10/23.
//

import SwiftUI

internal struct AppIconImage: View {
    private let name: String
    
    internal init(_ name: String) {
        self.name = name
    }
    
    internal var body: some View {
        if let uiImage = UIImage(named: name) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        } else {
            EmptyView()
        }
    }
}

struct AppIconImage_Previews: PreviewProvider {
    static var previews: some View {
        AppIconImage("AppIcon-Default")
    }
}
