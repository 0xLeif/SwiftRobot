//
//  SwiftRobotKeyboard.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

/// A component capable of using RobotKeyboard to control the keyboard
public struct SwiftRobotKeyboard: RobotKeyboardCapable {
    
    /// Check to see if the Key is currently being pressed down
    public func isPressed(_ key: RobotKeyboard.Key) async -> Bool {
        await keyboard.isPressed(key)
    }
}
