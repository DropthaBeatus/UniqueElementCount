import UIKit
import Foundation

extension Array where Element: Comparable {
    func countUniqueElements()->Int {
        let sorted = self.sorted(by: >)
        let start : (Element?, Int) = (.none, 0)
        print(type(of: start))
        let result = sorted.reduce(start){
            (previousResult, currentElement) in
            var uniqueCount = previousResult.1
            if(previousResult.0 != currentElement){
                uniqueCount += 1
            }
            return((currentElement, uniqueCount))
        }
        return result.1
    }
}


let values = [-1, -4, 0, 4, 34, 5, 0, -1, -1, -4, 0, 5]
let num = values.countUniqueElements()
print(num)
