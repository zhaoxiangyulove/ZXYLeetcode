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
}
