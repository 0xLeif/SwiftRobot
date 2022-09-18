//
//  RobotScreenCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

/// It powers SwiftRobot components with RobotScreen capability
protocol RobotScreenCapable { }
extension RobotScreenCapable {
    var screen: RobotScreen {
        get async {
            await Robot.default.screen
        }
    }
}
