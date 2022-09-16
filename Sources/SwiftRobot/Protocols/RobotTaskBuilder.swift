//
//  RobotTaskBuilder.swift
//  
//
//  Created by Ahmed Shendy on 08/09/2022.
//

import Foundation

@resultBuilder
public enum RobotTaskBuilder {
    public static func buildBlock(
        _ task: RobotTask
    ) -> RobotTask { task }
    
    public static func buildBlock(
        _ tasks: RobotTask...
    ) -> [RobotTask] { tasks }
    
    public static func buildOptional(
        _ task: RobotTask?
    ) -> RobotTask { task ?? SwiftClosureTask { } }
    
    public static func buildEither(
        first task: RobotTask
    ) -> RobotTask { task }
    
    public static func buildEither(
        second task: RobotTask
    ) -> RobotTask { task }
}
