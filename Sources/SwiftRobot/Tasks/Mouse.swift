//
//  Mouse.swift
//  
//
//  Created by Leif on 9/8/22.
//

import RobotKit
import CoreGraphics

private protocol MouseRobotTask: RobotTask { }
extension MouseRobotTask {
    var capability: RobotMouse {
        get async {
            await Robot.default.mouse
        }
    }
}

public struct MoveMouse: MouseRobotTask {
    private let displayID: CGDirectDisplayID
    private let location: CGPoint
    
    public init(
        displayID: CGDirectDisplayID = CGMainDisplayID(),
        to location: CGPoint
    ) {
        self.displayID = displayID
        self.location = location
    }
    
    public func run() async throws {
        await capability.move(to: location)
    }
}

public struct ClickMouse: MouseRobotTask {
    public enum MouseButton {
        case left, right
    }
    
    private let button: MouseButton
    
    public init(_ button: MouseButton) {
        self.button = button
    }
    
    public func run() async throws {
        switch button {
        case .left:     await capability.leftClick()
        case .right:    await capability.rightClick()
        }
    }
}

public struct MonitorMouse: MouseRobotTask {
    public enum MonitorAction {
        case start, stop
    }
    
    private let action: MonitorAction
    
    public init(_ action: MonitorAction) {
        self.action = action
    }
    
    public func run() async throws {
        switch action {
        case .start:    await capability.stopMonitor()
        case .stop:     await capability.stopMonitor()
        }
    }
}
