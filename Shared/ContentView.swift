//
//  ContentView.swift
//  Shared
//
//  Created by Jose campos on 30/05/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @ State var newnewTask: String=""
    var searchBar: some View{
        HStack{
            TextField("Insert New Task", text: self.$newnewTask)
            Button(action: self.addnewnewTask, label: {Text("Add New")})
        }
    }
    
    func addnewnewTask(){
        taskStore.tasks
            .append(Task(id:String(taskStore.tasks.count + 1), newTask:newnewTask))
        self.newnewTask = ""
        
    }
    
    func move(from source : IndexSet, to destination : Int){
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    
    }
    
    func delete(at OffSets : IndexSet){
        taskStore.tasks.remove(atOffsets: OffSets)
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                searchBar.padding()
                List {
                    
                    ForEach(self.taskStore.tasks){
                    task in
                        Text(task.newTask)
                        
                    }.onMove(perform: self.move).onDelete(perform: self.delete)
                   
                }.navigationTitle("To-Do List")
            }.navigationBarItems( trailing: EditButton())
        }
    }
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
