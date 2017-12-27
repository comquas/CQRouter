//
//  Vertex.swift
//  CQRouter
//
//  Created by Htain Lin Shwe on 7/4/17.
//  Copyright © 2017 comquas. All rights reserved.
//

import Foundation

class Vertex : Comparable {
    var id: String = ""
    var adjacencies: Array<Edge> = Array<Edge>()
    var minDistance = Double.greatestFiniteMagnitude
    var previous: Vertex?
    
    init(id: String) {
        self.id = id
    }
    
    init(id: String,miniDistance: Double) {
        self.id = id
        self.minDistance = miniDistance
    }
    
    static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return (lhs.minDistance == rhs.minDistance) && (lhs.id == rhs.id)
    }
    
    static func <(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.minDistance < rhs.minDistance
    }
    
    static func >(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.minDistance > rhs.minDistance
    }
    
    
}
