//
//  File.swift
//
//
//  Created by Ashish Shah on 11/04/23.
//

import Foundation

public var CombinationPackage: Bundle = .module

public class Combinations {
    
    public init() {}
    
    public func getCombinations<T>(array: [T], length: Int) -> [[T]] {
        
        if length == 0 {
            return [[]]
        }
        
        var combinations: [[T]] = []
        
        for i in array {
            let subCombinations = getCombinations(array: array, length: length - 1)
            for j in subCombinations {
                combinations.append([i] + j)
            }
        }
        
        return combinations
    }
    
    public func getUniqueCombinations<T>(array: [T], length: Int) -> [[T]] {
        if length == 0 {
            return [[]]
        }
        
        var result: [[T]] = []
        for (index, element) in array.enumerated() {
            var subArray = array
            subArray.remove(at: index)
            let subCombinations = getUniqueCombinations(array: subArray, length: length - 1)
            for i in subCombinations {
                result.append([element] + i)
            }
        }
        return result
    }
}
