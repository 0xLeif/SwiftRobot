//
//  ContentView.swift
//  SwiftRobotExample
//
//  Created by Ahmed Shendy on 08/09/2022.
//

import SwiftUI
import SwiftRobot

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .task {
                try? await SwiftRobot.run {
                    ClickMouse(.left)
                    
                    TypeKey(.e)
                    TypeKey(.f)
                    
                    await RobotTaskGroup {
                        MoveMouse(to: .center)
                    }

                    if true {
                        TypeKey(.b)
                    }
                    
                    if false {
                        TypeKey(.x)
                    } else {
                        await RobotTaskGroup {
                            TypeKey(.a)
                            TypeKey(.b)
                            TypeKey(.c)
                        }
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
