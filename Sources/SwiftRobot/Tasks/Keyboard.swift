//
//  Keyboard.swift
//  
//
//  Created by Ahmed Shendy on 08/09/2022.
//

import RobotKit

/// It powers every SwiftRobot keyboard task with RobotKeyboard Capability
private protocol KeyboardRobotTask: RobotTask, RobotKeyboardCapable { }

/// A RoboTask to type single RobotKeyboard key
public struct TypeKey: KeyboardRobotTask {
    private let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await keyboard.type(key)
    }
}

/// A RoboTask to type one or more RobotKeyboard keys
public struct TypeKeys: KeyboardRobotTask {
    private let keys: [RobotKeyboard.Key]
    
    public init(_ keys: RobotKeyboard.Key...) {
        self.keys = keys
    }
    
    public func run() async throws {
        await keyboard.type(keys: keys)
    }
}

/// A RoboTask to type a capitalized singe RobotKeyboard key
public struct TypeCapitalKey: KeyboardRobotTask {
    private let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await keyboard.typeShifted(key)
    }
}

/// A RoboTask to type one or more capitalized RobotKeyboard key
public struct TypeCapitalKeys: KeyboardRobotTask {
    private let keys: [RobotKeyboard.Key]
    
    public init(_ keys: RobotKeyboard.Key...) {
        self.keys = keys
    }
    
    public func run() async throws {
        await keyboard.typeShifted(keys: keys)
    }
}

/// A RoboTask to press a key down, until later executing ``ReleaseKey`` to release it
public struct PressKey: KeyboardRobotTask {
    private let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await keyboard.press(key)
    }
}

/// A RoboTask to release a key from being pressed
public struct ReleaseKey: KeyboardRobotTask {
    private let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await keyboard.release(key)
    }
}
