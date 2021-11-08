class Solution {
  // 268
  func missingNumber(_ nums: [Int]) -> Int {
    let count = nums.count
    var temp = [Int](repeating: 1, count: count)
    for item in nums {
      if item == count {
        continue
      }
      temp[item] = 0
    }
    return temp.firstIndex {
      $0 == 1
    } ?? count
  }
  
  // 598
  func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
    if ops.count == 0 {
      return m * n
    }
    var lastM = m
    var lastN = n
    ops.forEach { op in
      let m = op[0]
      let n = op[1]
      lastM = min(m, lastM)
      lastN = min(n, lastN)
    }
    return lastM * lastN;
  }
  
  // 392
  func isSubsequence(_ s: String, _ t: String) -> Bool {
    var idx = 0
    let count = s.count
    t.forEach { char in
      if idx == count {
        return
      }
      let temp = s[idx]
      if temp == char {
        idx += 1
      }
      
    }
    return idx == count
  }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
