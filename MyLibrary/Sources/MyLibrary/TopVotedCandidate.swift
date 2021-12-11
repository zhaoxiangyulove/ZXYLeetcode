//
//  TopVotedCandidate.swift
//  
//
//  Created by 赵翔宇 on 2021/12/11.
//

class TopVotedCandidate {
  private var _top = [Int: Int]()
  private let _times: [Int]
  init(_ persons: [Int], _ times: [Int]) {
    _times = times
    var topVoteCount = 0
    var lastPerson = 0
    var temp = [Int: Int]()
    for index in 0 ..< times.count {
      let person = persons[index]
      let time = times[index]
      let count = (temp[person] ?? 0) + 1
      temp[person] = count
      if count >= topVoteCount {
        _top[time] = person
        topVoteCount = count
        lastPerson = person
      } else {
        _top[time] = lastPerson
      }
    }
  }
  
  func q(_ t: Int) -> Int {
    if t >= _times.last! {
      return _top[_times.last!]!
    }
    for index in 0 ..< _times.count - 1 {
      let time = _times[index]
      if time == t || (t > time && t < _times[index + 1]) {
        return _top[time]!
      }
    }
    return _top[_times.last!]!
  }
}
