//
//  ContentView.swift
//  CPB_Firebase
//
//  Created by James Balek on 11/8/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

struct ContentView: View {
    @ObservedObject var collegeModel = ViewModel()
    @State var collegeName = ""
    @State var location = ""
    @State var numberOfStudents =  ""
    @State var URLOfCollege = ""
    var body: some View {
        VStack{
            HStack{
                TextField("Enter a College", text: $collegeName)
                Button("+"){
                    let newCollege = College(name: collegeName, completed: false)
                    collegeModel.AddCollege(currentCollege: newCollege)
                }
            }
            HStack{
                TextField("Enter location of College", text: $location)
                Button("+"){
                    let newCollege = College(name: collegeName, completed: false)
                    collegeModel.AddCollege(currentCollege: newCollege)
                    
                }
                
            }
            HStack{
                TextField("Enter Number of Students", text: $numberOfStudents)
                Button("+"){
                    let newCollege = College(name: collegeName, completed: false)
                    collegeModel.AddCollege(currentCollege: newCollege)
                    
                }
                
            }
            HStack{
                TextField("Enter URL of Collge", text: $URLOfCollege)
                Button("+"){
                    let newCollege = College(name: collegeName, completed: false)
                    collegeModel.AddCollege(currentCollege: newCollege)
                    
                }
                
            }
            List{
                ForEach(collegeModel.colleges, id:\.name) { currentCollege in
                    Text(currentCollege.name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
