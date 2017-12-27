//
//  StringHelper.swift
//  CQRouter
//
//  Created by Htain Lin Shwe on 6/4/17.
//  Copyright © 2017 comquas. All rights reserved.
//

import Foundation

extension String {
    //var count: Int { return self.characters.count }
    
    subscript (i: Int) -> Character {
        // wraps out of bounds indices
        let j = i % self.count
        // wraps negative indices
        let x = j < 0 ? j + self.count : j
        
        // quick exit for first
        guard x != 0 else {
            return self.characters.first!
        }
        
        // quick exit for last
        guard x != count - 1 else {
            return self.characters.last!
        }
        
        return self[self.index(self.startIndex, offsetBy: x)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let lb = r.lowerBound
        let ub = r.upperBound
        
        // quick exit for one character
        guard lb != ub else { return String(self[lb]) }
        
        return self[self.index(self.startIndex, offsetBy: lb)..<self.index(self.startIndex, offsetBy: ub)]
    }
    
    subscript (r: CountableClosedRange<Int>) -> String {
        return self[r.lowerBound..<r.upperBound + 1]
    }
    
    func length() -> Int {
        return self.lengthOfBytes(using: String.Encoding.utf8)
    }
}
