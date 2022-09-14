//
//  RobotMouseCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit
import CoreGraphics

protocol RobotMouseCapable { }
extension RobotMouseCapable {
    var mouse: RobotMouse {
        get async {
            await Robot.default.mouse
        }
    }
}
