//
//  RobotMouseCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

protocol RobotMouseCapable { }
extension RobotMouseCapable {
    var capability: RobotMouse {
        get async {
            await Robot.default.mouse
        }
    }
}
