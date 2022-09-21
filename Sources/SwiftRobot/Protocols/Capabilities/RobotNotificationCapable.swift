//
//  RobotNotificationCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

/// It powers SwiftRobot compnents with RobotMouse capability
protocol RobotNotificationCapable { }
extension RobotNotificationCapable {
    var notification: RobotNotification {
        get async {
            await Robot.default.notification
        }
    }
}
