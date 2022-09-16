//
//  Notification.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit
import UserNotifications

private protocol NotificationRobotTask: RobotTask, RobotNotificationCapable { }

public struct RequestNotificationAuthorization: NotificationRobotTask {
    private let isAuthorizationNeeded: Bool
    private let options: UNAuthorizationOptions
    
    public init(
        ifNeeded: Bool = true,
        options: UNAuthorizationOptions = [.alert, .sound]
    ) {
        self.isAuthorizationNeeded = ifNeeded
        self.options = options
    }
    
    public func run() async throws {
        if isAuthorizationNeeded {
            await notification.requestAuthorizationIfNeeded(options: options)
        } else {
            await notification.requestAuthorization(options: options)
        }
    }
}

public struct SendNotification: NotificationRobotTask {
    private let title: String
    private let subtitle: String?
    private let message: String
    
    public init(
        title: String,
        subtitle: String? = nil,
        message: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.message = message
    }
    
    public func run() async throws {
        try await notification.push(
            title: title,
            subtitle: subtitle,
            message: message
        )
    }
}
