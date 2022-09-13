//
//  Mouse.swift
//  
//
//  Created by Leif on 9/8/22.
//

import RobotKit
import CoreGraphics

private protocol MouseRobotTask: RobotTask, RobotMouseCapable { }
private protocol ScreenRobotTask: RobotTask, RobotScreenCapable { }

public enum ScreenLocation {
    case center
    
    case point(CGPoint)
    
    static func from(_ point: CGPoint) -> ScreenLocation {
        return .point(point)
    }
}

public struct MoveMouse: MouseRobotTask, ScreenRobotTask {
    private let displayID: CGDirectDisplayID
    private let location: ScreenLocation
    
    public init(
        displayID: CGDirectDisplayID = CGMainDisplayID(),
        to location: CGPoint
    ) {
        self.displayID = displayID
        self.location = ScreenLocation.from(location)
    }
    
    public init(
        displayID: CGDirectDisplayID = CGMainDisplayID(),
        to position: ScreenLocation
    ) {
        self.displayID = displayID
        self.location = position
    }
    
    public func run() async throws {
        await mouse.move(to: resolveLocationToCGPoint())
    }
    
    private func resolveLocationToCGPoint() async -> CGPoint {
        switch location {
        case .center:
            return await screen.center(display: displayID)
            
        case .point(let point):
            return point
        }
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
        case .left:     await mouse.leftClick()
        case .right:    await mouse.rightClick()
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
        case .start:    await mouse.stopMonitor()
        case .stop:     await mouse.stopMonitor()
        }
    }
}
