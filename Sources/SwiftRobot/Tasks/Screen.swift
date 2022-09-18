//
//  Screen.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit
import CoreGraphics

/// It powers every SwiftRobot screen task with RobotScreent Capability
private protocol ScreenRobotTask: RobotTask, RobotScreenCapable { }

/// A RobotTask to take screenshot of the display for a certain CGRect
public struct Screenshot: ScreenRobotTask {
    private let displayID: CGDirectDisplayID
    private let rect: CGRect
    private let handler: (CGImage?) async throws -> RobotTask
    
    public init(
        displayID: CGDirectDisplayID = CGMainDisplayID(),
        rect: CGRect,
        handler: @escaping (CGImage?) async throws -> RobotTask
    ) {
        self.displayID = displayID
        self.rect = rect
        self.handler = handler
    }
    
    public func run() async throws {
        try await SwiftRobot.run {
            let value = await screen.image(display: displayID, rect: rect)
            try await handler(value)
        }
    }
}
