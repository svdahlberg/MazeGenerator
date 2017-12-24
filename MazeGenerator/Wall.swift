//
//  Wall.swift
//  Maze
//
//  Created by Svante Dahlberg on 2017-08-06.
//  Copyright © 2017 Svante Dahlberg. All rights reserved.
//

import Foundation

public enum WallPlacement: Equatable, Hashable {
    case right, left, top, bottom, outer
}

public class Wall: Equatable {
    public let room1: Room?
    public let room2: Room?
    
    public init(room1: Room?, room2: Room?) {
        self.room1 = room1
        self.room2 = room2
    }
    
    public var wallPlacement: WallPlacement {
        guard let room1 = room1, let room2 = room2 else { return .outer }
        if room2.x > room1.x {
            return .right
        }
        if room2.x < room1.x {
            return .left
        }
        if room2.y < room1.y {
            return .top
        }
        if room2.y > room1.y {
            return .bottom
        }
        return .outer
    }
}

public func ==(lhs: Wall, rhs: Wall) -> Bool {
    return ((lhs.room1 == rhs.room1) && (lhs.room2 == rhs.room2)) || ((lhs.room1 == rhs.room2) && (lhs.room2 == rhs.room1))
}
