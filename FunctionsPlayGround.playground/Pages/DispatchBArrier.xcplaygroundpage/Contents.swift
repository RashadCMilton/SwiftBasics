import Foundation

/*
    DispatchBArrier - this is used to manage concurrent read write operation on shared resources
 */

class Database {
    private var record = [String]()
    func readRecord(taskNumber: Int) -> String{
        if self.record.count >= taskNumber {
            print("getting record for \(taskNumber)")
            return self.record[taskNumber]
        }
        return ""
    }
    func writeRecord(_ record: String){
        self.record.append(record)
        print("New record got added: \(record)")
    }
}
    

let db = Database()
for i in 0..<15 {
    db.writeRecord("Task \(i)")
}
// reading records
for i in 0..<15 {
    db.readRecord(taskNumber: i)
    
}
