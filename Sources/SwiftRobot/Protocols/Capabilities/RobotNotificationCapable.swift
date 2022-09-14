//
//  RobotNotificationCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit

protocol RobotNotificationCapable { }
extension RobotNotificationCapable {
    var notification: RobotNotification {
        get async {
            await Robot.default.notification
        }
    }
}
