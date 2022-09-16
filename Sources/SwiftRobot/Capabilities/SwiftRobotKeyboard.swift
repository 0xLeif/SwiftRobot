//
//  SwiftRobotKeyboard.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

public struct SwiftRobotKeyboard: RobotKeyboardCapable {
    public func isPressed(_ key: RobotKeyboard.Key) async -> Bool {
        await keyboard.isPressed(key)
    }
}
