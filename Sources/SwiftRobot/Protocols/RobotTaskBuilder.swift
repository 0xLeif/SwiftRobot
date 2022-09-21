//
//  RobotTaskBuilder.swift
//  
//
//  Created by Ahmed Shendy on 08/09/2022.
//

import Foundation

/// DSL api for SwiftRobot to help create RoboTasks in declarative way
@resultBuilder
public enum RobotTaskBuilder {
    
    /**
     It builds a single RobotTask from a single task expression
        ex:
            ```
            try await SwiftRobot.run {
                TypeKey(.a)
            }
            ```
    */
    public static func buildBlock(
        _ task: RobotTask
    ) -> RobotTask { task }
    
    /**
     It builds a RobotTask array from a group of task expressions
        ex:
            ```
            try await SwiftRobot.run {
                TypeKey(.a)
                // ...
                TypeKey(.z)
            }
            ```
    */
    public static func buildBlock(
        _ tasks: RobotTask...
    ) -> [RobotTask] { tasks }
    
    /**
     It builds an optional RobotTask from an if statement expression
        ex:
            ```
            try await SwiftRobot.run {
                if true {
                    MoveMouse(to: .center)
                }
            }
            ```
    */
    public static func buildOptional(
        _ task: RobotTask?
    ) -> RobotTask { task ?? SwiftClosureTask { } }
    
    /**
     It builds a single RobotTask from a **true** condition of if-else statement expression
        ex:
            ```
            try await SwiftRobot.run {
                if isReadyToMoveMouse {
                    MoveMouse(to: .center)
                } else {
                    // ...
                }
            }
            ```
    */
    public static func buildEither(
        first task: RobotTask
    ) -> RobotTask { task }
    
    /**
     It builds a single RobotTask from a **false condition** of if-else statement expression
        ex:
            ```
            try? await SwiftRobot.run {
                if isReadyToMoveMouse {
                    MoveMouse(to: .center)
                } else {
                    // ...
                }
            }
            ```
    */
    public static func buildEither(
        second task: RobotTask
    ) -> RobotTask { task }
}
