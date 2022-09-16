//
//  RobotVisionCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

protocol RobotVisionCapable { }
extension RobotVisionCapable {
    var vision: RobotVision {
        get async {
            await Robot.default.vision
        }
    }
}
