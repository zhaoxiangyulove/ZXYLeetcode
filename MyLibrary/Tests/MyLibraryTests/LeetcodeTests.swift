import XCTest
@testable import MyLibrary

final class LeetcodeTestCase: XCTestCase {
  let solution = Solution()
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
  
}
