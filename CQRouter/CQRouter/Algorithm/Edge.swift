//
//  Edge.swift
//  CQRouter
//
//  Created by Htain Lin Shwe on 7/4/17.
//  Copyright © 2017 comquas. All rights reserved.
//

import Foundation

class Edge {

    var target: Vertex
    var weight: Double
    init(target: Vertex, weight: Double) {
        self.target = target
        self.weight = weight
    }
    
}
