//
//  SwiftRobotMouse.swift
//  
//
//  Created by Leif on 9/10/22.
//

public struct SwiftRobotMouse: RobotMouseCapable {
    public var isMonitoringMouse: Bool {
        get async {
            await mouse.isObserving
        }
    }
}
