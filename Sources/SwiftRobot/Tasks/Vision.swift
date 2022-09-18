//
//  Vision.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit
import Vision

/// It powers every SwiftRobot vision task with RobotVision Capability
private protocol VisionRobotTask: RobotTask, RobotVisionCapable { }

/// A RobotTask to get the text in the provided image
public struct ReadImageText: VisionRobotTask {
    private let image: CGImage
    private let options: [VNImageOption: Any]
    private let handler: ([VNRecognizedTextObservation]) async throws -> RobotTask
    
    public init(
        in image: CGImage,
        options: [VNImageOption: Any] = [:],
        handler: @escaping ([VNRecognizedTextObservation]) async throws -> RobotTask
    ) {
        self.image = image
        self.options = options
        self.handler = handler
    }
    
    public func run() async throws {
        try await SwiftRobot.run {
            try await handler(vision.text(in: image, options: options))
        }
    }
}
