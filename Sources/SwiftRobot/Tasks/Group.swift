//
//   RobotTaskGroup.swift
//  
//
//  Created by Ahmed Shendy on 08/09/2022.
//

import Foundation

/**
 A RobotTask that groups one or more tasks
    ex:
        ```
        RobotTaskGroup {
            TypeKey(.a)
            MoveMouse(to: .center)
        }
        ```
*/
public struct RobotTaskGroup: RobotTask {
    private let tasks: [RobotTask]
    
    /// To group one task
    public init(
        @RobotTaskBuilder _ builder: () async throws -> RobotTask
    ) async rethrows {
        tasks = [try await builder()]
    }
    
    /// To group more one than task
    public init(
        @RobotTaskBuilder _ builder: () async throws -> [RobotTask]
    ) async rethrows {
        tasks = try await builder()
    }
    
    /// Run every task that's part of this group
    public func run() async throws {
        for task in tasks {
            try await task.run()
        }
    }
}
