import CoreGraphics
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
  
  func getHint(_ secret: String, _ guess: String) -> String {
    var ACount = 0
    var BCount = 0
    var secretDic = [Character: Int]()
    for (idx, char) in guess.enumerated() {
      let temp = secret[idx]
      if char == temp {
        ACount += 1
        continue
      }
      let secretCharCount = secretDic[temp] ?? 0
      if secretCharCount < 0 {
        BCount += 1
      }
      let guessCharCount = secretDic[char] ?? 0
      if guessCharCount > 0 {
        BCount += 1
      }
      secretDic[temp] = secretCharCount + 1
      secretDic[char] = guessCharCount - 1
    }
    return "\(ACount)A\(BCount)B"
  }
  
  func fib(_ n: Int) -> Int {
    if n == 0 {
      return 0
    }
    if n == 1 {
      return 1
    }
    var arr = [0, 1]
    for idx in 2 ... n {
      arr.append(arr[idx - 1] + arr[idx - 2])
    }
    return arr.last!
  }
  
  let maxScore = 6
  var dic = [String: Int]()
  func findMinStep(_ board: String, _ hand: String) -> Int {
    if backtrack(board, hand) == maxScore {
      return -1
    }
    return dic["\(board), \(hand)"] ?? -1
  }
  
  private func backtrack(_ board: String, _ hand: String) -> Int {
    var score = maxScore
    if board.isEmpty {
      return score
    }
    let key = "\(board), \(hand)"
    if let score = dic[key] {
      return score
    }
    for (idxH, charH) in hand.enumerated() {
      for (idxB, _) in board.enumerated() {
        var newB = board
        newB.insert(charH, at: newB.index(newB.startIndex, offsetBy: idxB))
        let ret = recur(newB)
        if ret.isEmpty {
          dic[key] = 1;
          return 1
        }
        var newH = hand
        newH.remove(at: newH.index(newH.startIndex, offsetBy: idxH))
        score = min(score, backtrack(newB, newH) + 1)
      }
    }
    dic[key] = score;
    return score
  }
  
  private func recur(_ board: String) -> String {
    let len = board.count;
    var l = 0
    for r in 0 ... len {
      if r < len, board[l] == board[r] {
        continue
      }
      if r - l > 2 {
        var temp = board
        temp.removeSubrange(temp.index(temp.startIndex, offsetBy: l)..<temp.index(temp.startIndex, offsetBy: r))
        return recur(temp)
      } else {
        l = r
      }
    }
    return board
  }
  
  func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
    var poisonedDuration = 0
    for index in 0 ..< timeSeries.count - 1 {
      let dif = timeSeries[index + 1] - timeSeries[index]
      poisonedDuration += dif < duration ? dif : duration
    }
    return poisonedDuration + duration
  }
  
  func divisorGame(_ n: Int) -> Bool {
    n & 1 == 0
  }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
