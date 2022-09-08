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
        _ tasks: any RobotTask...
    ) -> [any RobotTask] { tasks }
}
