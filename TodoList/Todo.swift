//
//  Todo.swift
//  TodoList
//
//  Created by 은구 on 2021/07/21.
//

import UIKit

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
