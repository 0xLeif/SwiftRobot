//
//  Robot+SwiftRobot.swift
//  
//
//  Created by Leif on 8/28/22.
//

import RobotKit

// The SwiftRobot engine
public enum SwiftRobot { }

// MARK: - Static Properties

/// An easy access for Robot capabilities from SwiftRobot engine
public extension SwiftRobot {
    static var screen: SwiftRobotScreen = SwiftRobotScreen()
    static var mouse: SwiftRobotMouse = SwiftRobotMouse()
    static var keyboard: SwiftRobotKeyboard = SwiftRobotKeyboard()
    static var vision: SwiftRobotVision = SwiftRobotVision()
    static var notification: SwiftRobotNotification = SwiftRobotNotification()
}

// MARK: - Static Functions

/// SwiftRobot runnable functionatlity
public extension SwiftRobot {
    
    /// To run one RoboTask asynchronously
    static func run(
        @RobotTaskBuilder _ builder: () async throws -> RobotTask
    ) async throws {
        try await builder().run()
    }
    
    /// To run one or more RoboTask asynchronously
    static func run(
        @RobotTaskBuilder _ builder: () async throws -> [RobotTask]
    ) async throws {
        for task in try await builder() {
            try await task.run()
        }
    }
    
    /// To run one RoboTask asynchronously on the Main Thread
    @MainActor
    static func main(
        @RobotTaskBuilder _ builder: () async throws -> RobotTask
    ) async throws {
        try await run(builder)
    }
    
    /// To run one or more RoboTask asynchronously on the Main Thread
    @MainActor
    static func main(
        @RobotTaskBuilder _ builder: () async throws -> [RobotTask]
    ) async throws {
        try await run(builder)
    }
}
