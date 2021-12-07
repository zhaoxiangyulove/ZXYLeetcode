import XCTest
@testable import MyLibrary

final class LeetcodeTestCase: XCTestCase {
  let solution = Solution()
  let mapSum = MapSum()
  func test_268() {
    XCTAssertEqual(solution.missingNumber([3,0,1]), 2)
    XCTAssertEqual(solution.missingNumber([0,1]), 2)
    XCTAssertEqual(solution.missingNumber([9,6,4,2,3,5,7,0,1]), 8)
  }
  
  func test_598() {
    XCTAssertEqual(solution.maxCount(3, 3, [[2,2],[3,3]]), 4)
  }
  
  func test_392() {
    XCTAssertTrue(solution.isSubsequence("abc", "ahbgdc"))
    XCTAssertFalse(solution.isSubsequence("axc", "ahbgdc"))
  }
  
  func test_299() {
    XCTAssertEqual(solution.getHint("1807", "7810"), "1A3B")
    XCTAssertEqual(solution.getHint("1123", "0111"), "1A1B")
    XCTAssertEqual(solution.getHint("1", "0"), "0A0B")
    XCTAssertEqual(solution.getHint("1", "1"), "1A0B")
  }
  
  func test_509() {
    XCTAssertEqual(solution.fib(2), 1)
    XCTAssertEqual(solution.fib(3), 2)
    XCTAssertEqual(solution.fib(4), 3)
  }
  
  // leetcode 超时
  func test_488() {
    XCTAssertEqual(solution.findMinStep("WRRBBW", "RB"), -1)
    XCTAssertEqual(solution.findMinStep("WWRRBBWW", "WRBRW"), 2)
    XCTAssertEqual(solution.findMinStep("G", "GGGGG"), 2)
    XCTAssertEqual(solution.findMinStep("RBYYBBRRB", "YRBGB"), 3)
    XCTAssertEqual(solution.findMinStep("WW", "WW"), 1)
    XCTAssertEqual(solution.findMinStep("RRYGGYYRRYYGGYRR", "GGBBB"), 5)
  }
  
  func test_495() {
    XCTAssertEqual(solution.findPoisonedDuration([1,4], 2), 4)
    XCTAssertEqual(solution.findPoisonedDuration([1,2], 2), 3)
  }
  
  func test_1025() {
    XCTAssertTrue(solution.divisorGame(2))
    XCTAssertFalse(solution.divisorGame(3))
  }
  
  func test_520() {
    XCTAssertTrue(solution.detectCapitalUse("USA"))
    XCTAssertFalse(solution.detectCapitalUse("FlaG"))
  }
  
  func test_677() {
    mapSum.insert("apple", 3)
    XCTAssertEqual(mapSum.sum("ap"), 3)
    mapSum.insert("app", 2)
    XCTAssertEqual(mapSum.sum("ap"),5)
  }

  func test_375() {
    XCTAssertEqual(solution.getMoneyAmount(10), 16)
    XCTAssertEqual(solution.getMoneyAmount(1), 0)
    XCTAssertEqual(solution.getMoneyAmount(2), 1)
  }
  
  func test_319() {
    XCTAssertEqual(solution.bulbSwitch(3), 1)
    XCTAssertEqual(solution.bulbSwitch(0), 0)
    XCTAssertEqual(solution.bulbSwitch(1), 1)
    XCTAssertEqual(solution.bulbSwitch(9999999), 3162)
  }
  
  func test_391() {
    XCTAssertTrue(solution.isRectangleCover([[1,1,3,3],[3,1,4,2],[3,2,4,4],[1,3,2,4],[2,3,3,4]]))
    XCTAssertFalse(solution.isRectangleCover([[1,1,2,3],[1,3,2,4],[3,1,4,2],[3,2,4,4]]))
    XCTAssertFalse(solution.isRectangleCover([[1,1,3,3],[3,1,4,2],[1,3,2,4],[3,2,4,4]]))
    XCTAssertFalse(solution.isRectangleCover([[1,1,3,3],[3,1,4,2],[1,3,2,4],[2,2,4,4]]))
    XCTAssertFalse(solution.isRectangleCover([[0,0,1,1],[0,0,2,1],[1,0,2,1],[0,2,2,3]]))
  }
  
  func test_318(){
    XCTAssertEqual(solution.maxProduct(["abcw","baz","foo","bar","xtfn","abcdef"]), 16)
    XCTAssertEqual(solution.maxProduct(["a","ab","abc","d","cd","bcd","abcd"]), 4)
    XCTAssertEqual(solution.maxProduct(["a","aa","aaa","aaaa"]), 0)
  }
  
  func test_563() {
    let root = TreeNode(1, TreeNode(2), TreeNode(3))
    XCTAssertEqual(solution.findTilt(root), 1)
  }
  
  func test_397() {
    XCTAssertEqual(solution.integerReplacement(8), 3)
    XCTAssertEqual(solution.integerReplacement(7), 4)
    XCTAssertEqual(solution.integerReplacement(199999999), 33)
  }
  
  func test_859() {
    XCTAssertTrue(solution.buddyStrings("ab", "ba"))
    XCTAssertFalse(solution.buddyStrings("ab", "ab"))
    XCTAssertTrue(solution.buddyStrings("aa", "aa"))
    XCTAssertTrue(solution.buddyStrings("aaaaaaabc", "aaaaaaacb"))
  }
  
  func test_423() {
    XCTAssertEqual(solution.originalDigits("owoztneoer"), "012")
    XCTAssertEqual(solution.originalDigits("fviefuro"), "45")
  }
  
  func test_700() {
    let node1 = TreeNode(2, TreeNode(1), TreeNode(3))
    let node = TreeNode(4, node1, TreeNode(7))
    XCTAssertNil(solution.searchBST(node, 5))
    XCTAssertEqual(solution.searchBST(node, 2), node1)
  }
  
  func test_786() {
    XCTAssertEqual(solution.kthSmallestPrimeFraction([1, 2, 3 ,5], 3), [2, 5])
    XCTAssertEqual(solution.kthSmallestPrimeFraction([1, 7], 1), [1, 7])
  }
  
  func test_400() {
//    XCTAssertEqual(solution.findNthDigit(3), 3)
    XCTAssertEqual(solution.findNthDigit(30000), 7)
  }
  
  func test_1146() {
    XCTAssertEqual(solution.maxPower("leetcode"), 2)
    XCTAssertEqual(solution.maxPower("abbcccddddeeeeedcba"), 5)
    XCTAssertEqual(solution.maxPower("triplepillooooow"), 5)
    XCTAssertEqual(solution.maxPower("hooraaaaaaaaaaay"), 11)
    XCTAssertEqual(solution.maxPower("tourist"), 1)
  }
  
  func test_1005() {
    XCTAssertEqual(solution.largestSumAfterKNegations([4,2,3], 1), 5)
    XCTAssertEqual(solution.largestSumAfterKNegations([3,-1,0,2], 3), 6)
    XCTAssertEqual(solution.largestSumAfterKNegations([2,-3,-1,5,-4], 2), 13)
  }
  
  func test_383() {
    XCTAssertFalse(solution.canConstruct("a", "b"))
    XCTAssertFalse(solution.canConstruct("aa", "ab"))
    XCTAssert(solution.canConstruct("aa", "aab"))
  }
  
  func test_372() {
    XCTAssertEqual(solution.superPow(2, [3]), 8)
    XCTAssertEqual(solution.superPow(2, [1, 0]), 1024)
    XCTAssertEqual(solution.superPow(1, [4, 3, 3, 8, 5, 2]), 1)
    XCTAssertEqual(solution.superPow(2147483647, [2, 0, 0]), 1198)
  }
  
  func test_1816() {
    XCTAssertEqual(solution.truncateSentence("Hello how are you Contestant", 4), "Hello how are you")
    XCTAssertEqual(solution.truncateSentence("What is the solution to this problem", 4), "What is the solution")
    XCTAssertEqual(solution.truncateSentence("chopper is not a tanuki", 5), "chopper is not a tanuki")
  }
  
  func test_1034() {
    XCTAssertEqual(solution.colorBorder([[1,1],[1,2]], 0, 0, 3), [[3,3],[3,2]])
    XCTAssertEqual(solution.colorBorder([[1,2,2],[2,3,2]], 0, 1, 3), [[1,3,3],[2,3,3]])
    XCTAssertEqual(solution.colorBorder([[1,1,1],[1,1,1],[1,1,1]], 1, 1, 2), [[2,2,2],[2,1,2],[2,2,2]])
  }
}
