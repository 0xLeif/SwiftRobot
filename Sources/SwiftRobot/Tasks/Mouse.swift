//
//  Mouse.swift
//  
//
//  Created by Leif on 9/8/22.
//

import RobotKit
import CoreGraphics

public enum ScreenLocation: RobotScreenCapable {
    case center
    
    case point(CGPoint)
    
    func point(
        displayID: CGDirectDisplayID = CGMainDisplayID()
    ) async -> CGPoint {
        switch self {
        case .center:
            return await screen.center(display: displayID)
            
        case .point(let point):
            return point
        }
    }
}

private protocol MouseRobotTask: RobotTask, RobotMouseCapable { }
public struct MoveMouse: MouseRobotTask {
    private let displayID: CGDirectDisplayID
    private let location: ScreenLocation
    
    public init(
        displayID: CGDirectDisplayID = CGMainDisplayID(),
        to location: CGPoint
    ) {
        self.displayID = displayID
        self.location = .point(location)
    }
    
    public init(
        displayID: CGDirectDisplayID = CGMainDisplayID(),
        to location: ScreenLocation
    ) {
        self.displayID = displayID
        self.location = location
    }
    
    public func run() async throws {
        await mouse.move(to: await location.point(displayID: displayID))
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
