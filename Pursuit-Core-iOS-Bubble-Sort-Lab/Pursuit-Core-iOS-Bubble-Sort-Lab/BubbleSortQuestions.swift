import Foundation

// Question One

// Implement bubble sort that accepts a closure about how to sort elements

func bubbleSort<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
 
    var array = arr
    
    for i in 0..<array.count {
        for j in 1..<array.count-i {
            if isSorted(array[j], array[j-1]) {
                //swap
                let tmp = array[j-1]
                array[j-1] = array[j]
                array[j] = tmp
            }
        }
    }
    
    return array
}

// Question Two

// Sort an array of Ints without changing the position of any negative numbers
// https://www.geeksforgeeks.org/sort-an-array-without-changing-position-of-negative-numbers/

func bubbleSortWithoutMovingNegatives<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    if arr.isEmpty{
        return [T]()
    }
    
    let zero = 0 as! T
    
//    let array = arr as! [Int]
    let array = arr

//    var positiveArr = (array.filter{$0 >= 0} as! [T])
    var positiveArr = (array.filter{$0 >= zero})

    var answer = [T]()
    var positiveIndex = 0
    
    for i in 0..<positiveArr.count {
        for j in 1..<positiveArr.count-i {
            if isSorted(positiveArr[j], positiveArr[j-1]) {
                //swap
                let tmp = positiveArr[j-1]
                positiveArr[j-1] = positiveArr[j]
                positiveArr[j] = tmp
            }
        }
    }
    
    for i in arr{
        if (i as! Int) < 0 {
            answer.append(i)
        }else{
            answer.append(positiveArr[positiveIndex])
            positiveIndex += 1
        }
    }
    return answer
}

// Question Three

// Implement Cocktail sort
// https://www.geeksforgeeks.org/cocktail-sort/

func cocktailSort<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var array = arr
    
    var start = 0
    var end = arr.count
    var swapped = true
    //    var answer = [T]()
    
    while swapped == true {
        swapped = false
        
        for i in start..<end-1 {
            //e.g array[i+1] > array[i]
            if isSorted(array[i+1], array[i]) {
                //swap
                let tmp = array[i]
                array[i] = array[i+1]
                array[i+1] = tmp
                
                swapped = true
            }
        }
        
        if swapped == false{
            return array
        }
        swapped = false
        end -= 1
        
        for j in (start+1...end).reversed(){
            if isSorted(array[j], array[j-1]) {
                //swap
                let tmp = array[j-1]
                array[j-1] = array[j]
                array[j] = tmp
                swapped = true
            }
        }
        
        start += 1
        
    }
    
    
    return array
}

// Question Four

// Implement bubble sort on a linked list

func bubbleSort<T: Comparable>(list: LinkedList<T>, by isSorted: (T, T) -> Bool) -> LinkedList<T> {
//    let someList = list
//    let head = someList.head
//    var swapped = true
//    if head != nil {
//
//        while true {
//            swapped = false
//            var current = head
//            print("swap bool is true")
//
//            while current?.next != nil {
//                if let left = current?.value, let right =
//                    current?.next?.value{
//                    if isSorted(right,left){
//                        print("Swap Occurs")
//                        //swap
//                        swapped = true
//                        print("left: \(left), right: \(right) ")
//                        let temp = current?.value
//                        current?.value = (current?.next!.value)!
//                        current?.next?.value = temp!
//                        print("swap bool is now false")
//                        current = current?.next
//                    }
//                    else{
//                        current = current?.next
//                    }
//                }
//            }
//            if swapped == false{
//                break
//            }else{
//                continue
//            }
//        }
//        return someList
//    }
//    return someList
    let someList = list
      let head = someList.head
      var swapped = true
      if head != nil {
          
          repeat {
              swapped = false
              var current = head
              
              while current?.next != nil {
                  if let left = current?.value, let right =
                      current?.next?.value{
                      if isSorted(right,left){
                          print("Swap Occurs")
                          //swap
                          swapped = true
                          print("left: \(left), right: \(right) ")
                          let temp = current?.value
                          current?.value = (current?.next!.value)!
                          current?.next?.value = temp!
                      }
                          current = current?.next
                  }
              }
              if swapped == false{
                  break
              }else{
                  continue
              }
          } while true
          
        return someList
      }
      return someList
}

