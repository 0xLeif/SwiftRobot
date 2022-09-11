//
//  RobotKeyboardCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

protocol RobotKeyboardCapable { }
extension RobotKeyboardCapable {
    var capability: RobotKeyboard {
        get async {
            await Robot.default.keyboard
        }
    }
}
