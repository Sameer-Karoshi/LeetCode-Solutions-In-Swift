class SnapshotArray {
    private var snapIdIndexValue: [Int: [Int: Int]] = [:]
    private var snapId = 0

    init(_ length: Int) {}
    
    func set(_ index: Int, _ val: Int) {
        snapIdIndexValue[snapId, default: [:]][index] = val
    }
    
    func snap() -> Int {
        let result = snapId
        snapId += 1 
        return result
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        for snapID in stride(from: snap_id, through: 0, by: -1) {
            if let snap = snapIdIndexValue[snapID], let v = snap[index] {
                 return v
            }
        }
        return 0
    }
}
/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snap_id)
 */