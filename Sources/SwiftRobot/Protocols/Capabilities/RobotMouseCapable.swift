//
//  RobotMouseCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit
import CoreGraphics

/// It powers SwiftRobot compnents with RobotMouse capability
protocol RobotMouseCapable { }
extension RobotMouseCapable {
    var mouse: RobotMouse {
        get async {
            await Robot.default.mouse
        }
    }
}
