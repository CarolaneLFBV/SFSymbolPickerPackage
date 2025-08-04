# SFSymbolPickerPackage

[![Platform](https://img.shields.io/badge/platform-iOS%2018%2B%20%7C%20macOS%2015%2B-blue.svg)]()
[![Swift](https://img.shields.io/badge/Swift-6.1-orange.svg)]()
[![SwiftPM](https://img.shields.io/badge/SwiftPM-compatible-green.svg)]()

A powerful and elegant SwiftUI-based SF Symbol picker that provides an intuitive interface for browsing and selecting Apple's SF Symbols in your iOS and macOS applications.

## Overview

SFSymbolPickerPackage offers a comprehensive solution for integrating SF Symbol selection into your SwiftUI apps. With over 5000+ symbols organized into 30+ categories, real-time search capabilities, and cross-platform support, it provides everything you need to let users browse and select SF Symbols effortlessly.

## Features

* ✨ **Comprehensive Symbol Library**: Access to 5000+ SF Symbols with complete metadata
*  📂 **Category-Based Organization**: Browse symbols through 30+ well-organized categories
*  🔍 **Real-Time Search**: Instant search functionality with symbol name and search term matching
* 🎯 **Category Filtering**: Limit symbol selection to specific categories
* 📱 **Cross-Platform**: Native support for both iOS 18+ and macOS 15+
* 🔄 **Version Tracking**: Symbol availability information by iOS/macOS version
*  ⚡ **SwiftUI Native**: Built entirely with SwiftUI using modern patterns
*  🎨 **Customizable Interface**: Adapts to platform-specific design patterns

## Installation

### Swift Package Manager

Add SFSymbolPickerPackage to your project using Xcode:

1. Open your project in Xcode
2. Go to **File → Add Package Dependencies**
3. Enter the repository URL:
   ```
   https://github.com/CarolaneLFBV/SFSymbolPickerPackage
   ```
4. Click **Add Package**

Or add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/SFSymbolPickerPackage", from: "1.0.0")
]
```

### Requirements

- iOS 18.0+ / macOS 15.0+
- Swift 6.1+
- Xcode 16.0+

## Usage

### Basic Implementation

```swift
import SwiftUI
import SFSymbolPickerPackage

struct ContentView: View {
    @State private var selectedSymbol = "star.fill"
    @State private var showingPicker = false
    @State private var loader = SymbolLoader()
    
    var body: some View {
        VStack {
            Image(systemName: selectedSymbol)
                .font(.system(size: 50))
            
            Button("Choose Symbol") {
                showingPicker = true
            }
        }
        .sheet(isPresented: $showingPicker) {
            SymbolView(
                loader: loader,
                selectedSymbol: $selectedSymbol
            )
        }
    }
}
```

### Category Filtering

Limit symbol selection to specific categories:

```swift
SymbolView(
    loader: SymbolLoader(),
    selectedSymbol: $selectedSymbol,
    limitedCategories: [.communication, .media, .devices]
)
```

### Pre-filled Search

Start with a specific search term:

```swift
SymbolView(
    loader: SymbolLoader(),
    selectedSymbol: $selectedSymbol,
    searchTerm: "heart"
)
```

### Single Category Mode

When only one category is specified, the picker automatically hides the category selector:

```swift
SymbolView(
    loader: SymbolLoader(),
    selectedSymbol: $selectedSymbol,
    limitedCategories: [.weather]
)
```

## API Reference

### SymbolView

The main view component for symbol selection.

```swift
public struct SymbolView: View {
    public init(
        loader: SymbolLoader,
        selectedSymbol: Binding<String>,
        limitedCategories: [CategoryEnum] = [],
        searchTerm: String = ""
    )
}
```

**Parameters:**
- `loader`: SymbolLoader instance that manages symbol data
- `selectedSymbol`: Binding to the currently selected symbol name
- `limitedCategories`: Optional array to limit available categories
- `searchTerm`: Optional pre-filled search term

### SymbolLoader

Observable class that manages symbol data loading and filtering.

```swift
@Observable
public class SymbolLoader {
    public init()
    func availableCategories(limitedCategories: [CategoryEnum]) -> [Category]
}
```

### CategoryEnum

Available symbol categories:

```swift
public enum CategoryEnum: String {
    case accessibility, arrows, automotive, cameraandphotos, commerce,
         communication, connectivity, devices, editing, fitness, gaming,
         health, home, human, indices, keyboard, maps, math, media,
         multicolor, nature, objectsandtools, privacyandsecurity, shapes,
         textformatting, time, transportation, variablecolor, weather,
         whatsnew, uncategorized
}
```

### Data Models

#### Symbol
```swift
struct Symbol {
    let name: String
    let releaseYear: String
    let categories: [Category]
    let searchTerms: [String]
    let osVersions: [OSVersion]
}
```

#### Category
```swift
struct Category {
    let key: String
    let label: String
    let icon: String
}
```

## Data Sources

The package includes four comprehensive plist files:

- **`categories.plist`**: Symbol category definitions with icons and labels
- **`symbol_categories.plist`**: Mapping of symbols to their categories
- **`symbol_search.plist`**: Search terms associated with each symbol
- **`name_availability.plist`**: Symbol availability by iOS/macOS version

These files ensure accurate categorization, enhanced searchability, and proper version compatibility checking.

## Platform Differences

The picker automatically adapts to platform conventions:

- **iOS**: Uses `secondarySystemBackground` for search field styling
- **macOS**: Uses `quaternaryLabelColor` for search field styling
- **Search Field**: Includes autocapitalization control on iOS

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Created by Carolane Lefebvre

---

Made with ❤️ using SwiftUI