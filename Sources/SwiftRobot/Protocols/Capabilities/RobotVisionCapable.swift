//
//  RobotVisionCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

protocol RobotVisionCapable { }
extension RobotVisionCapable {
    var capability: RobotVision {
        get async {
            await Robot.default.vision
        }
    }
}
