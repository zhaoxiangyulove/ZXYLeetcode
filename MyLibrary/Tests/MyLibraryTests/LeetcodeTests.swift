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
  
  func test_689() {
    XCTAssertEqual(solution.maxSumOfThreeSubarrays([1,2,1,2,6,7,5,1], 2), [0,3,5])
    XCTAssertEqual(solution.maxSumOfThreeSubarrays([1,2,1,2,1,2,1,2,1], 2), [0,2,4])
  }
  
  func test_794() {
    XCTAssertFalse(solution.validTicTacToe(["O  ","   ","   "]))
    XCTAssertFalse(solution.validTicTacToe(["XOX"," X ","   "]))
    XCTAssertFalse(solution.validTicTacToe(["XXX","   ","OOO"]))
    XCTAssertTrue(solution.validTicTacToe(["XOX","O O","XOX"]))
    XCTAssertFalse(solution.validTicTacToe(["XXX","XOO","OO "]))
    XCTAssertFalse(solution.validTicTacToe(["OXX","XOX","OXO"]))
    XCTAssertFalse(solution.validTicTacToe(["OXX","XOX","OXO"]))
    XCTAssertFalse(solution.validTicTacToe(["OOO","XXO","XXX"]))
  }
  
  func test_50() {
    XCTAssertEqual(solution.myPow(2.00000, 10), 1024.00000, accuracy: 0.001)
    XCTAssertEqual(solution.myPow(2.10000, 3), 9.26100, accuracy: 0.001)
    XCTAssertEqual(solution.myPow(2.00000, -2), 0.25000, accuracy: 0.001)
  }
  
  func test_748() {
    XCTAssertEqual(solution.shortestCompletingWord("1s3 PSt", ["step", "steps", "stripe", "stepple"]), "steps")
    XCTAssertEqual(solution.shortestCompletingWord("1s3 456", ["looks", "pest", "stew", "show"]), "pest")
    XCTAssertEqual(solution.shortestCompletingWord("Ah71752", ["suggest","letter","of","husband","easy","education","drug","prevent","writer","old"]), "husband")
    XCTAssertEqual(solution.shortestCompletingWord("1s3 456", ["looks", "pest", "stew", "show"]), "pest")
  }
  
  func test_911() {
    let topVoted = TopVotedCandidate([0, 1, 1, 0, 0, 1, 0], [0, 5, 10, 15, 20, 25, 30])
    XCTAssertEqual(topVoted.q(3), 0)
    XCTAssertEqual(topVoted.q(12), 1)
    XCTAssertEqual(topVoted.q(25), 1)
    XCTAssertEqual(topVoted.q(15), 0)
    XCTAssertEqual(topVoted.q(24), 0)
    XCTAssertEqual(topVoted.q(8), 1)
  }
  
  func test_807() {
    XCTAssertEqual(solution.maxIncreaseKeepingSkyline([[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]), 35)
  }
  
  func test_630() {
    XCTAssertEqual(solution.scheduleCourse([[100, 200], [200, 1300], [1000, 1250], [2000, 3200]]), 3)
    XCTAssertEqual(solution.scheduleCourse([[1,2]]), 1)
    XCTAssertEqual(solution.scheduleCourse([[3,2],[4,3]]), 0)
    XCTAssertEqual(solution.scheduleCourse([[1,2],[2,3]]), 2)
    XCTAssertEqual(solution.scheduleCourse([[7,17],[3,12],[10,20],[9,10],[5,20],[10,19],[4,18]]), 4)
  }
  
  func test_851() {
    XCTAssertEqual(solution.loudAndRich([[1,0],[2,1],[3,1],[3,7],[4,3],[5,3],[6,3]], [3,2,5,4,6,1,7,0]), [5,5,2,5,4,5,6,7])
    XCTAssertEqual(solution.loudAndRich([], [0]), [0])
    XCTAssertEqual(solution.loudAndRich([], [1, 0]), [0, 1])
    XCTAssertEqual(solution.loudAndRich([[0,1],[0,2],[0,4],[0,5],[0,6],[0,7],[0,9],[0,10],[0,12],[0,14],[0,15],[0,16],[0,17],[0,18],[1,2],[1,4],[1,6],[1,7],[1,8],[1,10],[1,11],[1,13],[1,14],[1,15],[1,18],[1,19],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[2,9],[2,10],[2,11],[2,12],[2,14],[2,15],[2,17],[3,4],[3,5],[3,6],[3,7],[3,8],[3,9],[3,11],[3,12],[3,14],[3,18],[3,19],[4,5],[4,6],[4,7],[4,9],[4,11],[4,12],[4,13],[4,14],[4,16],[4,17],[4,18],[4,19],[5,6],[5,7],[5,9],[5,10],[5,11],[5,12],[5,13],[5,14],[5,16],[5,18],[6,7],[6,9],[6,10],[6,12],[6,13],[6,15],[6,17],[6,18],[7,8],[7,9],[7,10],[7,11],[7,12],[7,13],[7,14],[7,15],[7,16],[7,17],[7,18],[7,19],[8,9],[8,11],[8,13],[8,14],[8,15],[8,16],[8,17],[8,18],[8,19],[9,10],[9,12],[9,13],[9,15],[9,17],[9,19],[10,11],[10,12],[10,13],[10,14],[10,15],[10,16],[10,17],[10,18],[11,13],[11,15],[11,16],[11,17],[11,18],[11,19],[12,13],[12,15],[12,19],[13,17],[13,18],[13,19],[14,16],[14,17],[14,18],[14,19],[15,16],[15,17],[15,18],[15,19],[16,17],[16,18],[16,19],[17,19],[18,19]], [3,5,7,2,13,6,17,19,9,16,10,1,8,14,12,18,15,0,11,4]), [0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 11, 3, 11, 3, 11, 11, 17, 11, 17])
  }
  
  func test_1610() {
    XCTAssertEqual(solution.visiblePoints([[2,1],[2,2],[3,3]], 90, [1,1]), 3)
    XCTAssertEqual(solution.visiblePoints([[2,1],[2,2],[3,4],[1,1]], 90, [1,1]), 4)
    XCTAssertEqual(solution.visiblePoints([[1,0],[2,1]], 13, [1,1]), 1)
  }
  
  func test_235() {
    let root = TreeNode(6, TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5))), TreeNode(8, TreeNode(7), TreeNode(9)))
    XCTAssertEqual(solution.lowestCommonAncestor(root, TreeNode(2), TreeNode(8)).val, 6)
    XCTAssertEqual(solution.lowestCommonAncestor(root, TreeNode(2), TreeNode(4)).val, 2)
  }
  
  func test_530() {
    let root = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(6))
    XCTAssertEqual(solution.getMinimumDifference(root), 1)
    let root1 = TreeNode(236, TreeNode(104, nil, TreeNode(227)), TreeNode(701, nil, TreeNode(911)))
    XCTAssertEqual(solution.getMinimumDifference(root1), 9)
  }
  
  func test_1518() {
    XCTAssertEqual(solution.numWaterBottles(9, 3), 13)
    XCTAssertEqual(solution.numWaterBottles(15, 4), 19)
    XCTAssertEqual(solution.numWaterBottles(5, 5), 6)
    XCTAssertEqual(solution.numWaterBottles(2, 3), 2)
  }
  
  func test_419() {
    XCTAssertEqual(solution.countBattleships([["X",".",".","X"],[".",".",".","X"],[".",".",".","X"]]), 2)
    XCTAssertEqual(solution.countBattleships([["."]]), 0)
  }
  
  func test_997() {
    XCTAssertEqual(solution.findJudge(2, [[1,2]]), 2)
    XCTAssertEqual(solution.findJudge(3, [[1,3],[2,3]]), 3)
    XCTAssertEqual(solution.findJudge(3, [[1,3],[2,3],[3,1]]), -1)
    XCTAssertEqual(solution.findJudge(3, [[1,2],[2,3]]), -1)
    XCTAssertEqual(solution.findJudge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]]), 3)
  }
  
  func test_475() {
    XCTAssertEqual(solution.findRadius([1,2,3], [2]), 1)
    XCTAssertEqual(solution.findRadius([1,2,3,4], [1,4]), 1)
    XCTAssertEqual(solution.findRadius([1,5], [2]), 3)
  }
  
  func test_1154() {
    XCTAssertEqual(solution.dayOfYear("2019-01-09"), 9)
    XCTAssertEqual(solution.dayOfYear("2019-02-10"), 41)
    XCTAssertEqual(solution.dayOfYear("2003-03-01"), 60)
    XCTAssertEqual(solution.dayOfYear("2004-03-01"), 61)
  }
  
  func test_94() {
    let node = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
    XCTAssertEqual(solution.inorderTraversal(node), [1,3,2])
    XCTAssertEqual(solution.inorderTraversal(nil), [])
    let node1 = TreeNode(1)
    XCTAssertEqual(solution.inorderTraversal(node1), [1])
    let node2 = TreeNode(1, TreeNode(2), nil)
    XCTAssertEqual(solution.inorderTraversal(node2), [2,1])
    let node3 = TreeNode(1, nil, TreeNode(2))
    XCTAssertEqual(solution.inorderTraversal(node3), [1,2])
  }
  
  func test_257() {
    let node = TreeNode(1, TreeNode(2, nil, TreeNode(5)), TreeNode(3))
    XCTAssertEqual(solution.binaryTreePaths(node), ["1->2->5","1->3"])
    XCTAssertEqual(solution.binaryTreePaths(TreeNode(1)), ["1"])
  }
}
