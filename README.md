# __Array Unique Element Count Explanation__
We are creating an __extension__ of the Array type in Swift 4 that will count all unique elements in an array.  


### What is an extension?
An __extension__ is a protocol that adds new features/functions to all ready exisiting classes, structs, or types. We use an extension on the Array type so we can assign this function to any array type where elements are comparable.
```swift
extension Array where Element: Comparable {
}
```
##### countUniqueElements when comparable
We need to  use the __where Element: Comparable__ tag because we will need to compare all elements in the array to find out if the elements are unique to that array.
## Creating the function
Within the extension of Array we will need to create the function that must be called to count the Unique elements within the array. 
```swift
extension Array where Element: Comparable {
    func countUniqueElements()-> Int{
        ...
    }
}
```
#### Full Function
```swift
func countUniqueElements()->Int {
    let sorted = self.sorted(by: >)
    let start : (Element?, Int) = (.none, 0)
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
```
We have created the function countUniqueElements(). From here we do not need to pass the array itself in the function as we will be able to call __self__ within the function since we are using an extension. We will need to return an Int type as this will be the count of the array's unique elements. 
### Sorting the Array
The easiet solution when trying to find unique elements in an array is usually to sort it. This will lower the processing time and will not complicate the algorithm any further as you will only need to go through the array once after sorting. 
```swift
let sorted = self.sorted(by: >)
```
**self** is the array called in extension and we will assign its sorted value to **let sorted**

### Starting at the beginning of the array and moving through it
```swift
let start : (Element?, Int) = (.none, 0)
```
__start__ is a **tuple** a type that contains two values. This tuple contains two types of: **(Element?, Int)**

We assign **.none** as a enumeration of nil. So we create a type that will start as the first item we will compare its element, value of nil, to the next element in the array. the **Int** value will start as 0. This value will count the unique elements in the array. If we find an array will no elements in it we will return 0.
### Counting Unique elements by iteration
```swift
    let result = sorted.reduce(start){
      (previousResult, currentElement) in
      var uniqueCount = previousResult.1
      if(previousResult.0 != currentElement){
          uniqueCount += 1
      }
      return((currentElement, uniqueCount))
    }
```
In Swift 4 the **.reduce()** function is described as:
>"Returns the result of combining the elements of the sequence using the given closure."

*You can find more information about functions/types if you option+click the function in Xcode.*

We assign the tuple of **start** to iterate through the array from the beginning index of sorted. We use the function **.reduce()** to iterate through the array. 

**previousResult** is a tuple of type: **(Element?, Int)**. The first value was previous element or the element of **start** - nil. For every loop in **.reduce()** we will pass the current **currentElement** and **uniqueCount** into **previousResult**. We then will compare the **previousResult.0** value, the element, with the current element. If the elements have different values we will increase the value of **uniqueCount** by one. 
```swift
 if(previousResult.0 != currentElement){
          uniqueCount += 1
      }
```     
*We can iterate through the array once because we know the elements are sorted so any of the same values will be next to others and we will not increment **uniqueCount** unless their values are different.*

The function will continue to do this until we reach the end of the array and **result** will contain the values of the last element and the unique value count. 
```swift
    let result = sorted.reduce(start){
        ...
      return((currentElement, uniqueCount))
    }
```
**result** is a tuple type that has the same structure of **previousResult** and **start - (Element?, Int)**. After **result** gains its value we will return **result.1** the value of the unique element count.
```swift
return result.1
```
