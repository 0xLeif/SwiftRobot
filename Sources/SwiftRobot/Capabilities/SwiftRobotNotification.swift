//
//  SwiftRobotNotification.swift
//  
//
//  Created by Leif on 9/10/22.
//

import UserNotifications

/// A component capable of using RobotMouse to send notifications to the user
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
