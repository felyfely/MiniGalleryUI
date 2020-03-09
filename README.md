# MiniGalleryUI
an ui component for mini gallery

## Installation

MiniGalleryUI is available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:

```ruby
github "felyfely/MiniGalleryUI" "master"
```

## Usage

Use a single interface for displaying a gallery UI component
###### Swift
```swift
var items: [GalleryItem] // your data source
let vc = MiniGalleryUIServiceProvider.getMiniGalleryUIViewController(items: items)
```
if you want to track user interaction in this UI component, pass additional `delegate` parameter to the above function to get coresponding callback
