# SpringFadeTabs

SpringFadeTabController is a customizable, easy-to-use iOS library to enhance your UITabBarController's transition animations. With this library, you can add a spring fade transition animation to your tab bar controllers in your Swift applications.

<div align="center">
    <img src="preview.gif" width="250">
</div>

SpringFadeTabController is a UITabBarController subclass that provides a fresh and interactive user interface experience, designed to be easy to implement and modify. The controller includes a variety of handy delegate methods to customize animations and transitions.

# Features

- Smooth spring fade transition for tab switching.
- Customizable transition animation duration.
- Selection feedback generator for haptic feedback during transitions.
- Extension of UITabBarController for easy usage and integration.
- Animate transitions between view controllers based on index changes.

# Requirements

iOS 13.0+
Swift 5.1+
UIKit

# Installation

## Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding SpringFadeTabController as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/YourUserName/SpringFadeTabController.git", .upToNextMajor(from: "1.0.0"))
]
```

# Usage

After installing the library, import it wherever you want to use it:

```swift
import SpringFadeTabController
```

Set your UITabBarController to be a subclass of SpringFadeTabController.

```swift
class YourTabBarController: SpringFadeTabController {
    // Your code here
}
```

And that's it! Now, when you run your application, you should see the spring fade transition animation whenever you switch tabs.

For more usage examples, please see the Example folder.

# License

SpringFadeTabController is released under the MIT license. See [LICENSE](LICENSE) for details.

# Contribute

We would love for you to contribute to SpringFadeTabController, send us your pull request.

# Let us know

We’d be really happy if you sent us links to your projects where you use our component. Just send an email to your-email[at]domain.com and do let us know if you have any questions or suggestion.
