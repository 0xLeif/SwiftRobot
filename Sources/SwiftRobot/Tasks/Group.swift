//
//   RobotTaskGroup.swift
//  
//
//  Created by Ahmed Shendy on 08/09/2022.
//

import Foundation

public struct RobotTaskGroup: RobotTask {
    fileprivate let tasks: [any RobotTask]
    
    public init(
        @RobotTaskBuilder _ builder: () async throws -> RobotTask
    ) async rethrows {
        tasks = [try await builder()]
    }
    
    public init(
        @RobotTaskBuilder _ builder: () async throws -> [any RobotTask]
    ) async rethrows {
        tasks = try await builder()
    }
    
    public func run() async throws {
        for task in tasks {
            try await task.run()
        }
    }
}
