//
//  ViewModel.swift
//  CPB_Firebase
//
//  Created by James Balek on 11/8/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift


class ViewModel: ObservableObject {
    @Published var colleges: [College] = []
    init() {
        
    }
    
    func AddCollege(currentCollege: College) {
        colleges.append(currentCollege)
        AddToFirebase(colleges: currentCollege)
    }
    
    func AddToFirebase(colleges: College) {
        let database = Database.database().reference()
        database.child("Colleges").child(colleges.name).setValue(colleges.completed)
    
    }
    
    func PullFromFirebase() {
        let databaseRef = Database.database().reference().child("Colleges")
        databaseRef.getData { myError, myDataSnapshot in
            var newList: [College] = []
            for college in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                let nameofCollege = college.key
                let dictionary = college.value as! [String: Bool]
                guard let completed = dictionary["Completed"] else { return }
                
                let currentCollege = College(name: nameofCollege, completed: completed)
            }
            self.colleges = newList
        }
    }
}
