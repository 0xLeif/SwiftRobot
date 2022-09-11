//
//  RobotScreenCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

protocol RobotScreenCapable { }
extension RobotScreenCapable {
    var capability: RobotScreen {
        get async {
            await Robot.default.screen
        }
    }
}
