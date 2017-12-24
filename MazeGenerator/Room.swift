//
//  Room.swift
//  Maze
//
//  Created by Svante Dahlberg on 2017-08-06.
//  Copyright © 2017 Svante Dahlberg. All rights reserved.
//

import Foundation

public class Room: Equatable {
    public let x: Int
    public let y: Int
    public var walls: [Wall]
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
        walls = [Wall]()
    }
    
    public var outerWalls: [Wall] {
        return walls.filter { $0.room1 == nil || $0.room2 == nil }
    }
    
    public var isOuterRoom: Bool {
        return outerWalls.count == 1
    }
    
    public var isCornerRoom: Bool {
        return outerWalls.count == 2
    }
    
    public func wallPlacementForOuterWall(in maze: Maze) -> WallPlacement? {
        if x == 0 {
            return .left
        }
        if y == 0 {
            return .top
        }
        else if x == maze.width - 1 {
            return .right
        }
        else if y == maze.height - 1 {
            return .bottom
        }
        return nil
    }
    
    public func wallPlacementsForCornerRoom(in maze: Maze) -> [WallPlacement] {
        if x == 0, y == 0 {
            return [.left, .top]
        }
        if x == maze.width - 1, y == 0 {
            return [.top, .right]
        }
        if x == 0, y == maze.height - 1 {
            return [.left, .bottom]
        }
        if x == maze.width - 1, y == maze.height - 1 {
            return [.bottom, .right]
        }
        return []
    }
    
    public func wallPlacements(in maze: Maze) -> [WallPlacement] {
        var wallPlacements = walls.map { $0.wallPlacement }.filter { $0 != .outer }
        if isCornerRoom {
            wallPlacements.append(contentsOf: wallPlacementsForCornerRoom(in: maze))
        } else if isOuterRoom, let outerWallPlacement = wallPlacementForOuterWall(in: maze) {
            wallPlacements.append(outerWallPlacement)
        }
        
        return wallPlacements
    }
}

public func ==(lhs: Room, rhs: Room) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}
