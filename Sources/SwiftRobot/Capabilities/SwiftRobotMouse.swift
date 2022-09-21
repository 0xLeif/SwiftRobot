//
//  SwiftRobotMouse.swift
//  
//
//  Created by Leif on 9/10/22.
//

/// A component capable of using RobotMouse to control the mouse
public struct SwiftRobotMouse: RobotMouseCapable {
    
    /// Computed property to know if the Robot is monitoring mouse movement
    public var isMonitoringMouse: Bool {
        get async {
            await mouse.isObserving
        }
    }
}
