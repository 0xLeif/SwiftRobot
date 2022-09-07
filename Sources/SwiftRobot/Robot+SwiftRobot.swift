//
//  Robot+SwiftRobot.swift
//  
//
//  Created by Leif on 8/28/22.
//

import RobotKit

// MARK: - RobotTask

public protocol RobotTask {
    func run() async throws
}

// MARK: - RobotTaskBuilder

@resultBuilder
public enum RobotTaskBuilder {
    public static func buildBlock(
        _ components: any RobotTask...
    ) -> [any RobotTask] { components }
}

// MARK: - RobotTaskGroup

struct RobotTaskGroup: RobotTask {
    var tasks: [any RobotTask]
    
    init(
        @RobotTaskBuilder _ builder: () async throws -> [any RobotTask]
    ) async rethrows {
        tasks = try await builder()
    }
    
    func run() async throws {
        for task in tasks {
            try await task.run()
        }
    }
}

// MARK: - Keyboard RobotTasks

protocol KeyboardRobotTasking: RobotTask { }
extension KeyboardRobotTasking {
    var capability: RobotKeyboard {
        get async {
            await Robot.default.keyboard
        }
    }
}

struct TypeKey: KeyboardRobotTasking {
    var key: RobotKeyboard.Key
    
    init(_ key: RobotKeyboard.Key) {
        self.key = key
    }
    
    func run() async throws {
        await capability.type(key)
    }
}
