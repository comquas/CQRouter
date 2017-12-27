//
//  Router.swift
//  CQRouter
//
//  Created by Htain Lin Shwe on 7/4/17.
//  Copyright © 2017 comquas. All rights reserved.
//

import Foundation

private struct Message {
    let vertex: Vertex
    let priority: Int
}

extension Message: Equatable {
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return (lhs.vertex == rhs.vertex && lhs.priority == rhs.priority)
    }
}

private func < (m1: Message, m2: Message) -> Bool {
    return m1.priority < m2.priority
}

class Router {
    static func shortestPath(source: Vertex, target: Vertex) {
        var queue: PriorityQueue = PriorityQueue<Message>(sort: <)
        
        source.minDistance = 0
        
        queue.enqueue(Message(vertex: source, priority: 100))
        
        while !queue.isEmpty {
            guard let res = queue.dequeue() else {
                return
            }
            let u = res.vertex
            
            if u == target {
                return
            }
            
            for e: Edge in u.adjacencies {
                let v = e.target
                let weight = e.weight
                let distanceThroughU = u.minDistance + weight
                if distanceThroughU < v.minDistance {
                    
                    queue.remove(Message(vertex: v, priority: 100))
                    v.minDistance = distanceThroughU
                    v.previous = u
                    
                    queue.enqueue(Message(vertex: v, priority: 100))
                }
            }
        }
    }
    
    static func path(target: Vertex) -> Array<Vertex> {
        var current: Vertex? = target
        
        var path: Array<Vertex> = Array<Vertex>()
        
        if let c = current {
            path.append(c)
        }
        
    
        
        while current != nil {
            
            current = current?.previous
            if let c = current {
                path.append(c)
            }

        }
        
        return path.reversed()
    }
}
