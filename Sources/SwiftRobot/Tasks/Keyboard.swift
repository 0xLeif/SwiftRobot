//
//  Keyboard.swift
//  
//
//  Created by Ahmed Shendy on 08/09/2022.
//

import RobotKit

fileprivate protocol KeyboardRobotTask: RobotTask { }
extension KeyboardRobotTask {
    fileprivate var capability: RobotKeyboard {
        get async {
            await Robot.default.keyboard
        }
    }
}

public struct TypeKey: KeyboardRobotTask {
    fileprivate let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await capability.type(key)
    }
}

public struct TypeKeys: KeyboardRobotTask {
    fileprivate let keys: [RobotKeyboard.Key]
    
    public init(_ keys: RobotKeyboard.Key...) {
        self.keys = keys
    }
    
    public func run() async throws {
        await capability.type(keys: keys)
    }
}

public struct TypeCapitalKey: KeyboardRobotTask {
    fileprivate let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await capability.typeShifted(key)
    }
}

public struct TypeCapitalKeys: KeyboardRobotTask {
    fileprivate let keys: [RobotKeyboard.Key]
    
    public init(_ keys: RobotKeyboard.Key...) {
        self.keys = keys
    }
    
    public func run() async throws {
        await capability.typeShifted(keys: keys)
    }
}

public struct PressKey: KeyboardRobotTask {
    fileprivate let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await capability.press(key)
    }
}

public struct ReleaseKey: KeyboardRobotTask {
    fileprivate let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await capability.press(key)
    }
}
