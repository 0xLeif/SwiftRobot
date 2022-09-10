//
//  Keyboard.swift
//  
//
//  Created by Ahmed Shendy on 08/09/2022.
//

import RobotKit

private protocol KeyboardRobotTask: RobotTask { }
extension KeyboardRobotTask {
    var capability: RobotKeyboard {
        get async {
            await Robot.default.keyboard
        }
    }
}

public struct TypeKey: KeyboardRobotTask {
    private let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await capability.type(key)
    }
}

public struct TypeKeys: KeyboardRobotTask {
    private let keys: [RobotKeyboard.Key]
    
    public init(_ keys: RobotKeyboard.Key...) {
        self.keys = keys
    }
    
    public func run() async throws {
        await capability.type(keys: keys)
    }
}

public struct TypeCapitalKey: KeyboardRobotTask {
    private let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await capability.typeShifted(key)
    }
}

public struct TypeCapitalKeys: KeyboardRobotTask {
    private let keys: [RobotKeyboard.Key]
    
    public init(_ keys: RobotKeyboard.Key...) {
        self.keys = keys
    }
    
    public func run() async throws {
        await capability.typeShifted(keys: keys)
    }
}

public struct PressKey: KeyboardRobotTask {
    private let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await capability.press(key)
    }
}

public struct ReleaseKey: KeyboardRobotTask {
    private let key: RobotKeyboard.Key
    
    public init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    public func run() async throws {
        await capability.release(key)
    }
}
