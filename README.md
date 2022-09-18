# SwiftRobot

*Tell your Mac what to do, **declaratively***

## What is SwiftRobot?

It is the declarative Layer for [RobotKit](https://github.com/0xLeif/RobotKit). It provides several tasks of type `RobotTask` that helps client define their required tasks in declarative way.

## Robot Tasks
- `MouseRobotTask`: A Robot task for mouse capability
  - `MoveMouse`: Change mouse position to a custom or predefined points
  - `ClickMouse`: Click the right & left mouse buttons
  - etc
- `KeyboardRobotTask`: A Robot task for keyboard capability
  - `TypeKey`: Type single RobotKeyboard key
  - `PressKey`: Press a key down, until later executing ``ReleaseKey`` to release it 
  - etc
- `ScreenRobotTask`: A Robot task for screen capability
  - `Screenshot`: Take screenshot of the display for a certain `CGRect`
  - etc
- `NotificationRobotTask`: A Robot task for notification capability
  - `SendNotification`: Send notification to the user
- `Vision`: A Robot task for vision capability
  - `ReadImageText`: Get the text in the provided image
- `SwiftClosureTask`: Execute a bunch of Swift language expressions
- `RobotTaskGroup`: Group one or more tasks

## Basic Usage
Just import `SwiftRobot`
```swift
import SwiftRobot
```

Now ask SwiftRobot to run one or more task:
```swift
import SwiftRobot

try await SwiftRobot.run {
  MoveMouse(to: .center)
  TypeKey(.a)
  // ...
}
```

You can also ask SwiftRobot execute tasks on the main queue
```swift
try await SwiftRobot.main {
  TypeCapitalKey(.h)
  TypeKey(.e)
  // ...
}
```

## Robot Task Examples
- **Hello World** Example
```swift
// Type Hello World
try await SwiftRobot.run {
  TypeCapitalKey(.h)
  TypeKey(.e)
  TypeKey(.l)
  TypeKey(.l)
  TypeKey(.o)
  
  TypeKey(.Space)
  
  TypeCapitalKey(.W)
  TypeKey(.o)
  TypeKey(.r)
  TypeKey(.l)
  TypeKey(.d)
}
```
You can group these tasks using `RobotTaskGroup` then as SwiftRobot to run the group:
```swift
var hwTaskGroup: RobotTaskGroup {
    get async {
        await RobotTaskGroup {
            TypeCapitalKey(.h)
            TypeKey(.e)
            TypeKey(.l)
            TypeKey(.l)
            TypeKey(.o)
            
            TypeKey(.Space)
            
            TypeCapitalKey(.W)
            TypeKey(.o)
            TypeKey(.r)
            TypeKey(.l)
            TypeKey(.d)
        }
    }
}

try await SwiftRobot.run {
  await hwTaskGroup

  // ...
}
```
