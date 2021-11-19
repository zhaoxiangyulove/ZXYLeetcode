import Darwin
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
  
  func detectCapitalUse(_ word: String) -> Bool {
    let hasLowercase = word.first {
      $0 > "Z"
    } != nil
    guard hasLowercase else {
      return true
    }
    let temp = word.suffix(from: word.index(after: word.startIndex))
    return temp.first {
      $0 < "a"
    } == nil
  }

  func getMoneyAmount(_ n: Int) -> Int {
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
    for i in stride(from: n - 1, to: 0, by: -1) {
      for j in i + 1 ... n {
        dp[i][j] = Int.max
        for k in i ..< j {
          dp[i][j] = min(dp[i][j], k + max(dp[i][k - 1], dp[k + 1][j]))
        }
      }
    }
    return dp[1][n]
  }
  
  func bulbSwitch(_ n: Int) -> Int {
    Int(floor(sqrt(Double(n))))
  }
  
  func isRectangleCover(_ rectangles: [[Int]]) -> Bool {
    var leftBottom = (rectangles[0][0], rectangles[0][1]);
    var rightTop = (rectangles[0][2], rectangles[0][3])
    var points = [(Int, Int)]()
    var temp = 0
    for rectangle in rectangles {
      leftBottom = (min(leftBottom.0, rectangle[0]), min(leftBottom.1, rectangle[1]))
      rightTop = (max(rightTop.0,rectangle[2]), max(rightTop.1, rectangle[3]))
      temp += (rectangle[2] - rectangle[0]) * (rectangle[3] - rectangle[1])
      for point in [(rectangle[0], rectangle[1]), (rectangle[2], rectangle[1]), (rectangle[2], rectangle[3]), (rectangle[0], rectangle[3])] {
        if let pointIndex = points.firstIndex(where: {
          point.0 == $0.0 && point.1 == $0.1
        }) {
          points.remove(at: pointIndex)
        } else {
          points.append(point)
        }
      }
    }
    let target = (rightTop.0 - leftBottom.0) * (rightTop.1 - leftBottom.1)
    return target == temp && points.count == 4 && containPoint(leftBottom: leftBottom, rightTop: rightTop, in: points)
  }
  
  func containPoint(leftBottom: (Int, Int), rightTop: (Int, Int), in points: [(Int, Int)]) -> Bool {
    let temp = [(leftBottom.0, leftBottom.1), (rightTop.0, rightTop.1), (leftBottom.0, rightTop.1), (rightTop.0, leftBottom.1)]
    for point in points {
      guard temp.contains(where: { (x, y) in
        x == point.0 && y == point.1
      }) else {
        return false
      }
    }
    return true
  }
  
  func maxProduct(_ words: [String]) -> Int {
    let masks = words.map { word -> Int in
      var mask = 0
      for char in word {
        mask |= 1 << (char.asciiValue! - 97)
      }
      return mask
    }
    let count = masks.count
    var maxP = 0
    for i in 0 ..< count {
      for j in i+1 ..< count {
        if masks[i] & masks[j] == 0 {
          maxP = max(maxP, words[i].count * words[j].count)
        }
      }
    }
    return maxP
  }
  
  var sum = 0
  func findTilt(_ root: TreeNode?) -> Int {
    _ = mapTilt(root)
    return sum
  }
  
  func mapTilt(_ root: TreeNode?) -> Int {
    guard let root = root else {
      return 0
    }
    let left = mapTilt(root.left)
    let right = mapTilt(root.right)
    sum += abs(right - left)
    return root.val + left + right
  }
  
  func integerReplacement(_ n: Int) -> Int {
    var step = 0
    var m = n
    while m != 1 {
      if m % 2 == 1 {
        let temp = m - 1
        if temp / 2 % 2 == 1 && temp / 2 != 1 {
          m += 1
        } else {
          m = temp
        }
      } else {
        m = m / 2
      }
      step += 1
    }
    return step
  }
}



extension StringProtocol {
  subscript(offset: Int) -> Character {
    self[index(startIndex, offsetBy: offset)]
  }
}
