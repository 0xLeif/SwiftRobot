//
//  RobotKeyboardCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

/// It powers SwiftRobot compnents with RobotKeyboard capability
protocol RobotKeyboardCapable { }
extension RobotKeyboardCapable {
    var keyboard: RobotKeyboard {
        get async {
            await Robot.default.keyboard
        }
    }
}
