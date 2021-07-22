//
//  Todo.swift
//  TodoList
//
//  Created by 은구 on 2021/07/21.
//

import UIKit

struct Todo: Codable, Equatable {
    let id: Int // 각각 TodoList 별로 구분하기 위한 변수
    var isDone: Bool // 각각의 TodoList가 완료되었는가에 대한 변수
    var detail: String // 각각의 TodoList의 내용에 대한 변수
    var isToday: Bool // 각각의 TodoList가 오늘 해야하는 일인가에 대한 변수
    
    mutating func update(isDone: Bool, detail: String, isToday: Bool) {
//        update 로직 추가[O]
        self.isDone = isDone
        self.detail = detail
        self.isToday = isToday
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
//        == 의 연산자 정의 : 동등 조건 추가[O]
        return lhs.id == rhs.id // leftHandSide, rightHandSide
    }
}

class TodoManager {
    static let shared = TodoManager() // SingleTone 객체를 만듬 한개의 객체만 사용
    
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    func createTodo(detail: String, isToday: Bool) -> Todo {
//        TODO: create 로직 추가[O]
        let nextId = TodoManager.lastId + 1
        TodoManager.lastId = nextId
        
        return Todo(id: nextId, isDone: false, detail: detail, isToday: isToday)
    }
    
    func addTodo(_ todo: Todo) {
//        TODO: add 로직 추가[O]
        todos.append(todo)
        saveTodo()
    }
    
    func deleteTodo(_ todo: Todo) {
//        TODO: delete 로직 추가[O]
        todos = todos.filter { $0.id != todo.id } // 밑에 코드와 동일
//        todos = todos.filter { existingTodo in
//            return existingTodo.id != todo.id
//        }
        
//        if let index = todos.firstIndex(of: todo) {
//            todos.remove(at: index)
//        }
//        데이터가 방대하다면 위 로직이 효율적일 수 있음
        saveTodo()
    }
    
    func updateTodo(_ todo: Todo) {
//        TODO: update 로직 추가[O]
        guard let index = todos.firstIndex(of: todo) else { return }
        todos[index].update(isDone: todo.isToday, detail: todo.detail, isToday: todo.isToday)
        saveTodo()
    }
    
    func saveTodo() {
        
    }
    
    func retrieveTodo() {
        
    }
    
}


class TodoViewModel {
    enum Section: Int, CaseIterable {
        case today
        case upcoming
        
        var title: String {
            switch self {
            case .today: return "Today"
            default: return "Upcoming"
            }
        }
    }
}
