//
//  Direction.swift
//  Maze
//
//  Created by Svante Dahlberg on 2017-08-20.
//  Copyright © 2017 Svante Dahlberg. All rights reserved.
//

import Foundation

public enum Direction {
    case right, left, up, down
    
    public static func direction(from wallPlacement: WallPlacement) -> Direction? {
        switch wallPlacement {
        case .right: return .right
        case .left: return .left
        case .top: return .up
        case .bottom: return .down
        case .outer: return nil
        }
    }
    
    public var opposite: Direction {
        switch self {
        case .right: return .left
        case .left: return .right
        case .up: return .down
        case .down: return .up
        }
    }
}
