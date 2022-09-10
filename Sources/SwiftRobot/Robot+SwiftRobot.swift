//
//  Robot+SwiftRobot.swift
//  
//
//  Created by Leif on 8/28/22.
//

import RobotKit

public enum SwiftRobot { }

// MARK: - Static Properties

public extension SwiftRobot {
    static var isMonitoringMouse: Bool {
        get async {
            await Robot.default.mouse.isObserving
        }
    }
}

// MARK: - Static Functions

public extension SwiftRobot {
    static func run(
        @RobotTaskBuilder _ builder: () async throws -> RobotTask
    ) async throws {
        try await builder().run()
    }
    
    static func run(
        @RobotTaskBuilder _ builder: () async throws -> [RobotTask]
    ) async throws {
        for task in try await builder() {
            try await task.run()
        }
    }
    
    @MainActor
    static func main(
        @RobotTaskBuilder _ builder: () async throws -> RobotTask
    ) async throws {
        try await run(builder)
    }
    
    @MainActor
    static func main(
        @RobotTaskBuilder _ builder: () async throws -> [RobotTask]
    ) async throws {
        try await run(builder)
    }
}
