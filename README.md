# AppIconView

A SwiftUI view for presenting and changing iOS app icons effortlessly.

## Overview

`AppIconView` is a SwiftUI view tailored to showcase the available app icons in a list. It integrates seamlessly with the [AppIcon](https://github.com/kevinhermawan/AppIcon) utility, providing an intuitive interface for users to select and change app icons on the fly.

## Installation

You can add `AppIconView` and `AppIcon` as dependencies to your project using Swift Package Manager by adding them to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/kevinhermawan/AppIcon.git", .upToNextMajor(from: "2.0.0")),
    .package(url: "https://github.com/kevinhermawan/AppIconView.git", .upToNextMajor(from: "2.0.0"))
]
```

Alternatively, in Xcode:

1. Open your project in Xcode.
2. Click on `File` -> `Swift Packages` -> `Add Package Dependency...`
3. Enter the repository URL: `https://github.com/kevinhermawan/AppIconView.git`
4. Choose the version you want to add. You probably want to add the latest version.
5. Ensure both `AppIconView` and `AppIcon` are selected in the list of libraries or modules to add.
6. Click `Add Package`.

## Usage

```swift
import AppIcon
import AppIconView

struct ContentView: View {
    var body: some View {
        NavigationView {
            AppIconView(current: AppIcon.current, defined: AppIcon.defined)
                .navigationTitle("App Icon")
        }
    }
}
```

For a detailed guide on setting up alternate app icons and the necessary `Info.plist` configurations, refer to the official Apple documentation on ["Configuring Your App to Use Alternate App Icons"](https://developer.apple.com/documentation/xcode/configuring_your_app_to_use_alternate_app_icons).

## License

[MIT License](/LICENSE)
