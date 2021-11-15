class MapSum {
  lazy var dic = [String: Int]()
  
  func insert(_ key: String, _ val: Int) {
    dic[key] = val
  }
  
  func sum(_ prefix: String) -> Int {
    let keys = dic.keys.compactMap {
      $0.hasPrefix(prefix) ? $0 : nil
    }
    return keys.reduce(0) { preVale, key in
      preVale + dic[key]!
    }
  }
}
