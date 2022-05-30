//
//  datastore.swift
//  todolist
//
//  Created by Jose campos on 30/05/22.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable{
    var id = String()
    var newTask = String()
    
}

class TaskStore: ObservableObject{
    @Published var tasks = [Task]()
}
