//
//  RobotTask.swift
//  
//
//  Created by Ahmed Shendy on 08/09/2022.
//

import Foundation

/// A protocol definition for RobotTask
public protocol RobotTask {
    func run() async throws
}
