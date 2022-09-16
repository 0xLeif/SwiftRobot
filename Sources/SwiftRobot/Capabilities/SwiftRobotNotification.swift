//
//  SwiftRobotNotification.swift
//  
//
//  Created by Leif on 9/10/22.
//

import UserNotifications

public struct SwiftRobotNotification: RobotNotificationCapable {
    public var delegate: UNUserNotificationCenterDelegate {
        get async {
            await notification.delegate
        }
    }
    
    public var authorizationStatus: UNAuthorizationStatus {
        get async {
            await notification.getAuthorizationStatus()
        }
    }
}
