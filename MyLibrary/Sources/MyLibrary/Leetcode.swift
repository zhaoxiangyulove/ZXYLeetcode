import Foundation
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
  
  func buddyStrings(_ s: String, _ goal: String) -> Bool {
    if s.count != goal.count { return false }
    if s == goal, Set(s).count < s.count { return true }
    var arr = [[Character]]()
    let zip = zip(s, goal)
    for (c1, c2) in zip {
      if c1 != c2 {
        if arr.count > 2 { return false }
        arr.append([c1, c2])
      }
    }
    return arr.count == 2 && arr[0] == arr[1].reversed()
  }
  
  func originalDigits(_ s: String) -> String {
    var digits: [Int] = [Int](repeating: 0, count: 10)
    for item in s {
      switch item {
      case "z":// zero
        digits[0] += 1
      case "o":// zero one two four
        digits[1] += 1
      case "w":// two
        digits[2] += 1
      case "t":// two three eight
        digits[3] += 1
      case "u":// four
        digits[4] += 1
      case "f":// four five
        digits[5] += 1
      case "s":// six seven
        digits[6] += 1
      case "v":// five seven
        digits[7] += 1
      case "g":// eight
        digits[8] += 1
      case "n":// one seven nine
        digits[9] += 1
      default:
        break
      }
    }
    digits[1] = digits[1] - digits[0] - digits[2] - digits[4]
    digits[3] = digits[3] - digits[2] - digits[8]
    digits[5] = digits[5] - digits[4]
    digits[7] = digits[7] - digits[5]
    digits[6] = digits[6] - digits[7]
    digits[9] = (digits[9] - digits[1] - digits[7]) / 2
    var result: String = ""
    for i in 0..<digits.count {
      for _ in 0..<digits[i] { result += "\(i)"}
    }
    return result
  }
  
  func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else {
      return nil
    }
    var temp = [root];
    while temp.count != 0 {
      let node = temp.removeLast()
      if node.val == val {
        return node
      }
      if let left = node.left {
        temp.append(left)
      }
      if let right = node.right {
        temp.append(right)
      }
    }
    return nil
  }
  
  func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
    var list = [[Int]]()
    for i in 0 ..< arr.count {
      for j in (i + 1) ..< arr.count {
        list.append([arr[i], arr[j]])
      }
    }
    list.sort { x, y in
      (x[0] * y[1] - y[0] * x[1]) < 0
    }
    return list[k - 1]
  }
  
  func findNthDigit(_ n: Int) -> Int {
    var n = n
    
    // 整数位数
    var d = 1
    var count = 9
    
    while n > d * count {
      n -= d * count
      d += 1
      count *= 10
    }
    let index = n - 1
    let start = Int(pow(Double(10), Double(d - 1)))
    
    let num = start + index / d
    let digitIndex = index % d
    let digit = (num / Int(pow(Double(10), Double(d - digitIndex - 1)))) % 10
    
    return digit
  }
  
  func maxPower(_ s: String) -> Int {
    var maxCount = 1
    var temp = 0
    _ = s.reduce(s.first) { char1, char2 in
      if char1 == char2 {
        temp += 1
        maxCount = max(maxCount, temp)
      } else {
        temp = 1
      }
      return char2
    }
    return maxCount
  }
  
  func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
    var temp = nums.sorted()
    var n = k
    for index in 0..<temp.count {
      if n == 0 || temp[index] >= 0 {
        break
      }
      temp[index] = -temp[index]
      n -= 1
    }
    if n % 2 != 0 {
      temp.sort()
      temp[0] = -temp[0]
    }
    return temp.reduce(0, +)
  }
  
  func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var temp = [Int](repeating: 0, count: 26)
    let a = "a".unicodeScalars.first!.value
    magazine.unicodeScalars.forEach { unicode in
      let index = Int(unicode.value - a)
      temp[index] += 1
    }
    for unicode in ransomNote.unicodeScalars {
      let index = Int(unicode.value - a)
      let count = temp[index]
      if count == 0 {
        return false
      }
      temp[index] = count - 1
    }
    return true
  }
  
  let base = 1337
  func superPow(_ a: Int, _ b: [Int]) -> Int {
    if b.count == 0 {
      return 1
    }
    var temp = b
    let last = temp.removeLast()
    let part1 = myPow(a, last)
    let part2 = myPow(superPow(a, temp), 10)
    return (part1 * part2) % base
  }
  
  func myPow(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
      return 1
    }
    if b % 2 == 0 {
      return myPow(((a % base) * (a % base)) % base, b / 2)
    } else {
      return ((a % base) * myPow(a, b - 1)) % base
    }
  }
  
  func truncateSentence(_ s: String, _ k: Int) -> String {
    var temp = s.split(separator: " ", maxSplits: k)
    if k < temp.count {
      temp.removeLast()
    }
    return temp.joined(separator: " ")
  }
  
  func colorBorder(_ grid: [[Int]], _ row: Int, _ col: Int, _ color: Int) -> [[Int]] {
    var visited = Set<String>()
    var needVisited = ["\(row),\(col)"]
    var result = grid
    let initColor = grid[row][col]
    let offsets = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    while needVisited.count != 0 {
      let current = needVisited.removeLast()
      if visited.contains(current) {
        continue
      }
      visited.insert(current)
      let temp = current.split(separator: ",")
      let row = Int(temp[0])!
      let col = Int(temp[1])!
      var count = 0
      for (x, y) in offsets {
        let nearX = row + x
        let nearY = col + y
        if hasTheSameColor(initColor, grid, nearX, nearY) {
          if !visited.contains("\(nearX),\(nearY)") {
            needVisited.append("\(nearX),\(nearY)")
          }
          count += 1
        }
      }
      if count != 4 {
        result[row][col] = color
      }
    }
    return result
  }
  
  func hasTheSameColor(_ initColor: Int, _ grid: [[Int]], _ nearRow: Int, _ nearCol: Int ) -> Bool {
    let m = grid.count
    let n = grid[0].count
    if nearRow == m || nearRow == -1 || nearCol == n || nearCol == -1 {
      return false
    }
    return grid[nearRow][nearCol] == initColor
  }
  
  func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
    var ans = [Int](repeating: 0, count: 3)
    
    var sum1 = 0, maxSum1 = 0, maxSum1Idx = 0
    var sum2 = 0, maxSum2 = 0, maxSum2Idx1 = 0, maxSum2Idx2 = 0
    var sum3 = 0, maxTotal = 0
    
    for i in (k * 2) ..< nums.count {
      sum1 += nums[i - k * 2]
      sum2 += nums[i - k]
      sum3 += nums[i]
      if i >= k * 3 - 1 {
        if sum1 > maxSum1 {
          maxSum1 = sum1
          maxSum1Idx = i - k * 3 + 1
        }
        if maxSum1 + sum2 > maxSum2 {
          maxSum2 = maxSum1 + sum2
          maxSum2Idx1 = maxSum1Idx
          maxSum2Idx2 = i - k * 2 + 1
        }
        if maxSum2 + sum3 > maxTotal {
          maxTotal = maxSum2 + sum3
          ans[0] = maxSum2Idx1
          ans[1] = maxSum2Idx2
          ans[2] = i - k + 1
        }
        sum1 -= nums[i - k * 3 + 1]
        sum2 -= nums[i - k * 2 + 1]
        sum3 -= nums[i - k + 1]
      }
    }
    return ans
  }
  
  func validTicTacToe(_ board: [String]) -> Bool {
    var xIndex = Set<String>()
    var oIndex = Set<String>()
    for (a, str) in board.enumerated() {
      for (b, char) in str.enumerated() {
        if char == "X" {
          xIndex.insert("\(a),\(b)")
        } else if char == "O" {
          oIndex.insert("\(a),\(b)")
        }
      }
    }
    let xCount = xIndex.count
    let oCount = oIndex.count
    if oCount > xCount || xCount - oCount >= 2 {
      return false
    }
    let xInLine = checkInLine(points: xIndex)
    let oInLine = checkInLine(points: oIndex)
    if xInLine && oInLine {
      return false
    }
    if xInLine {
      return xCount - oCount == 1
    }
    if oInLine {
      return xCount == oCount
    }
    return true
  }
  
  func checkInLine(points: Set<String>) -> Bool {
    let lines = [
      ["0,0", "0,1", "0,2"],
      ["1,0", "1,1", "1,2"],
      ["2,0", "2,1", "2,2"],
      ["0,0", "1,0", "2,0"],
      ["0,1", "1,1", "2,1"],
      ["0,2", "1,2", "2,2"],
      ["0,0", "1,1", "2,2"],
      ["0,2", "1,1", "2,0"]
    ]
    for line in lines {
      let temp = Set(line)
      if temp.isSubset(of: points) {
        return true
      }
    }
    return false
  }
  
  func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
      return 1
    }
    if n < 0 {
      return 1.0 / myPow(x, -n)
    }
    if n % 2 == 0 {
      return myPow(x * x, n / 2)
    }
    return x * myPow(x, n - 1)
  }
  
  func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
    var charSet = CharacterSet()
    charSet.formUnion(.decimalDigits)
    charSet.formUnion(.whitespacesAndNewlines)
    let trimStr = licensePlate.filter {
      !$0.isNumber && !$0.isWhitespace
    }
    var temp = [Int](repeating: 0, count: 26)
    let a = "a".unicodeScalars.first!.value
    let A = "A".unicodeScalars.first!.value
    trimStr.unicodeScalars.forEach { unicode in
      let index = Int(unicode.value - (unicode.value >= a ? a : A))
      temp[index] += 1
    }
    var result = (Int.max, "")
    for word in words {
      var check = temp
      for unicode in word.unicodeScalars {
        let index = Int(unicode.value - a)
        let count = check[index]
        check[index] = count - 1
      }
      var needAddCharCount = 0
      var containAllChar = true
      for count in check {
        if count > 0 {
          containAllChar = false
          break
        }
        needAddCharCount -= count
      }
      if containAllChar == false {
        continue
      }
      if needAddCharCount < result.0 {
        result.0 = needAddCharCount
        result.1 = word
      }
    }
    return result.1
  }
  
  func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
    var sum = 0
    var xMax = [Int]()
    var yMax = [Int]()
    for a in 0 ..< grid.count {
      var tempMax = 0
      for temp in grid {
        tempMax = max(tempMax, temp[a])
      }
      xMax.append(tempMax)
    }
    for temp in grid {
      var tempMax = 0
      for a in temp {
        tempMax = max(tempMax, a)
      }
      yMax.append(tempMax)
    }
    for indexX in 0 ..< xMax.count {
      for indexY in 0 ..< yMax.count {
        sum += min(xMax[indexX], yMax[indexY]) - grid[indexY][indexX]
      }
    }
    return sum
  }
  
  func scheduleCourse(_ courses: [[Int]]) -> Int {
    let temp = courses.sorted {
      $0[1] < $1[1]
    }
    var result = [Int]()
    var total = 0
    for course in temp {
      let duration = course[0]
      let ddl = course[1]
      if duration + total <= ddl {
        total += duration
        result.append(duration)
        continue
      }
      if result.count == 0 {
        continue
      }
      result.sort()
      let last = result.last!
      if last > duration {
        total -= last - duration
        result.removeLast()
        result.append(duration)
      }
    }
    return result.count
  }
  
  func loudAndRich(_ richer: [[Int]], _ quiet: [Int]) -> [Int] {
    if richer.isEmpty {
      var temp = [Int](repeating: 0, count: quiet.count)
      for index in 0..<temp.count {
        temp[index] = index
      }
      return temp
    }
    var richDic = [Int: [Int]]()
    for rich in richer {
      let r = rich[0]
      let l = rich[1]
      var temp = richDic[l] ?? [Int]()
      temp.append(r)
      richDic[l] = temp
    }
    var tempDic = [Int: [Int]]()
    richDic.keys.forEach { key in
      var temp = [key]
      var result = [Int]()
      while !temp.isEmpty {
        let first = temp.removeFirst()
        if let values = tempDic[first] {
          result.append(contentsOf: values)
          continue
        }
        let richers = richDic[first] ?? [Int]()
        temp.append(contentsOf: richers)
        result.append(contentsOf: richers)
      }
      richDic[key] = result
      tempDic[key] = result
    }
    var result = [Int]()
    for index in 0..<quiet.count {
      guard let richers = richDic[index] else {
        result.append(index)
        continue
      }
      var questest = quiet[index]
      var temp = index
      for richer in richers {
        let qr = quiet[richer]
        if questest < qr {
          continue
        }
        temp = richer
        questest = qr
      }
      result.append(temp)
    }
    return result
  }
  
  func visiblePoints(_ points: [[Int]], _ angle: Int, _ location: [Int]) -> Int {
    var list = [Double]()
    var cnt = 0
    let x = location[0], y = location[1]
    let pi = Double.pi
    for point in points {
      let a = point[0], b = point[1]
      if a == x, b == y {
        cnt += 1
        continue
      }
      list.append(atan2(Double(b - y), Double(a - x)))
    }
    list.sort()
    let m = list.count
    for i in 0 ..< m {
      list.append(list[i] + 2 * pi)
    }
    var maxCnt = 0
    var right = 0
    let toDegree = Double(angle) * pi / 180
    for i in 0 ..< m {
      let curr = list[i] + toDegree
      while right < list.count, list[right] <= curr {
        right += 1
      }
      maxCnt = max(maxCnt, right - i)
    }
    return maxCnt + cnt
  }
  
  func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root, let p = p, let q = q else {
      return nil
    }
    let nodeL = p.val > q.val ? q : p
    let nodeR = p.val > q.val ? p : q
    return lowestCommonAncestor(root, nodeL, nodeR)
  }
  
  func lowestCommonAncestor(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> TreeNode {
    if p.val <= root.val && q.val >= root.val {
      return root
    }
    if q.val < root.val {
      return lowestCommonAncestor(root.left!, p, q)
    }
    return lowestCommonAncestor(root.right!, p, q)
  }
  
  func getMinimumDifference(_ root: TreeNode?) -> Int {
    guard let root = root else {
      return 0
    }
    var leftMin = Int.max
    var rightMin = Int.max
    if let left = root.left {
      var temp = left
      while let right = temp.right {
        temp = right
      }
      leftMin = min(getMinimumDifference(root.left), root.val - temp.val)
    }
    if let right = root.right {
      var temp = right
      while let left = temp.left {
        temp = left
      }
      rightMin = min(getMinimumDifference(root.right), temp.val - root.val)
    }
    return min(leftMin, rightMin)
  }
  
  func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
    var result = numBottles
    var empty = numBottles
    while empty >= numExchange {
      let remain = empty % numExchange
      let newBottom = empty / numExchange
      result += newBottom
      empty = newBottom + remain
    }
    return result
  }
  
  func countBattleships(_ board: [[Character]]) -> Int {
    var count = 0
    let rowCount = board.count
    let colCount = board[0].count
    for row in 0..<rowCount {
      for col in 0..<colCount {
        if board[row][col] == "." {
          continue
        }
        var right = false
        var bottom = false
        if col != colCount - 1 {
          right = board[row][col + 1] == "X"
        }
        if row != rowCount - 1 {
          bottom = board[row + 1][col] == "X"
        }
        if !right && !bottom {
          count += 1
        }
      }
    }
    return count
  }
}



extension StringProtocol {
  subscript(offset: Int) -> Character {
    self[index(startIndex, offsetBy: offset)]
  }
}
