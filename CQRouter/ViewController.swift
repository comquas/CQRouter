//
//  ViewController.swift
//  CQRouter
//
//  Created by Htain Lin Shwe on 6/4/17.
//  Copyright © 2017 comquas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let router = CQRouter()
        let path = router.route(fromID: "1817", toID: "2135")
        var prevDist = 0.0
        for v:Vertex in path {
            if (v.minDistance == 0) {
                print("ID = \(v.id), start")
            }
            else if (v.minDistance - prevDist) > 50 {
                print("ID = \(v.id), arrive by bus")
            }
            else {
                print("ID = \(v.id), arrive by walking")
            }
            
            prevDist = v.minDistance
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

