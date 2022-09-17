//
//  Mouse.swift
//  
//
//  Created by Leif on 9/8/22.
//

import RobotKit
import CoreGraphics

/// It powers every SwiftRobot mouse task with RobotMouse Capability
private protocol MouseRobotTask: RobotTask, RobotMouseCapable { }

/// A RoboTask to change mouse position to a custom or predefined points
public struct MoveMouse: MouseRobotTask {
    private let displayID: CGDirectDisplayID
    private let location: ScreenLocation
    
    public init(
        displayID: CGDirectDisplayID = CGMainDisplayID(),
        to location: ScreenLocation
    ) {
        self.displayID = displayID
        self.location = location
    }
    
    public func run() async throws {
        await mouse.move(to: await location.toPoint(displayID: displayID))
    }
}

/// A RoboTask to click the right & left mouse buttons
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
        case .left:     await mouse.leftClick()
        case .right:    await mouse.rightClick()
        }
    }
}

/// A RoboTask to start/stop monitoring mouse movement events
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
        case .start:    await mouse.stopMonitor()
        case .stop:     await mouse.stopMonitor()
        }
    }
}
