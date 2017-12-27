//
//  CQRouter.swift
//  CQRouter
//
//  Created by Htain Lin Shwe on 6/4/17.
//  Copyright © 2017 comquas. All rights reserved.
//

import Foundation


class CQRouter {
    
    let weightData = [
        "|" : 160.0,
        ">" : 170.0,
        "<" : 180.0,
        "=" : 190.0,
    ]
    
    var pointDict = [String: Vertex]()
    var edgeDict = [String: Edge]()

    
    init() {
        loadFile()
    }
    
    private func loadFile() {
        
        let file = Bundle.main.path(forResource: "router", ofType: "txt")
        
        let reader = LineReader(path: file!)
        
        if reader == nil {
            //return; // cannot open file
            print("Cannot open file")
            
        }
        else {
            var fromID = ""
            var toID = ""
            for line in reader! {
                
                let tmStopId = line.trimmingCharacters(in: .newlines)
                if tmStopId[0] != " " {
                    fromID = tmStopId
                    createPOI(stopID: fromID)
                }
                else {
                    let (realStopID,weight) = getToIdWithWeight(stopID: tmStopId)
                    toID = realStopID
                    
                    createPOI(stopID: toID)
                    
                    if let fromPOI = pointDict[fromID] ,
                        let toPOI = pointDict[toID] {
                    
                        if let e = getEdge(from: fromPOI, to: toPOI, weight: weight) {
                            fromPOI.adjacencies.append(e)
                        }

                    }
                }
            }
        }
        
    }
    
    
    func route(fromID: String,toID: String) -> Array<Vertex> {
        

        for (_,value) in self.pointDict {
            value.previous = nil
            value.minDistance = Double.greatestFiniteMagnitude
        }
        
        if let fromPOI = self.pointDict[fromID],
            let toPOI = self.pointDict[toID] {
            
            Router.shortestPath(source: fromPOI, target: toPOI)
    
            return Router.path(target: toPOI)
    
        }
        return Array<Vertex>()
    }
    
    
    func getToIdWithWeight(stopID: String) -> (stopID: String,weight: Double) {
        
        var weight = 0.0
        var newstopID = stopID
        if (stopID[0] == " ") {
            //let check 4 space or not
            
            if stopID.length() > 4 && stopID[0...3] == "    " {
                
                //walking, near by stop
                weight = 50
                newstopID = stopID.trimmingCharacters(in: .whitespaces)
                

                
            }
            else if stopID.length() > 2 && stopID[0...1] == "  " {
                
                //ok, it can be direct. but not sure yet.
                weight = 100
                let strLength = stopID.length()
                newstopID = stopID[2...(strLength-1)]
                
                //time to check what kind of length it
                let newStopIDFirst:String = newstopID[0]
                
                
                
                if let newWeight = self.weightData[newStopIDFirst] {
                    newstopID = removeFirst(str: newstopID)
                    weight = newWeight
                }
            }
            
            
        }
        return (newstopID,weight)
    }
    
    func removeFirst(str: String) -> String {
        let strLength = str.length()
        return str[1...(strLength - 1)]
    }
    
    func createPOI(stopID: String) {
        if (pointDict[stopID] == nil) {
            let poi = Vertex(id: stopID)
            pointDict[stopID] = poi
        }
    
    }
    
    func getEdge(from:Vertex, to: Vertex, weight: Double) -> Edge? {
        let edgeID = "\(from.id)_\(to.id)_\(weight)"
        if (edgeDict[edgeID] == nil) {
            let e = Edge(target: to, weight: weight)
            edgeDict[edgeID] = e
        }
        return edgeDict[edgeID]
        
    }
}
