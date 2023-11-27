//
//  TODOSwiftUIView.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/11/8.
//

import SwiftUI

struct TODOSwiftUIView: View {
    @State private var todos = [
        Todo(name: "Write SwiftUI book", category: .work),
        Todo(name: "Read Bible", category: .personal),
        Todo(name: "Bring kids out to play", category: .family),
        Todo(name: "Fetch wife", category: .family),
        Todo(name: "Call mum", category: .family)
    ]
    @State private var showAddTodoView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos, id: \.id) { todo in
                    NavigationLink {
                        VStack {
                            Text(todo.name)
                            Circle().frame(width: 50, height: 50).foregroundColor(todo.category.tintColor)
                        }
                    } label: {
                        HStack {
                            Circle().frame(width: 20, height: 20).foregroundColor(todo.category.tintColor)
                            Text(todo.name)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    todos.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    todos.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationTitle("Todo Items")
            .navigationBarItems(leading: Button(action: addTodo, label: {
                Text("Add")
            }).sheet(isPresented: $showAddTodoView, content: {
                TODOAddSwiftUIView(showAddTodoView: self.$showAddTodoView, todos: self.$todos)
            }), trailing: EditButton())
        }
    }
    
    private func addTodo() {
        self.showAddTodoView.toggle()
    }
}

struct Todo: Identifiable {
    let id = UUID()
    let name: String
    let category: TodoCategory
}

enum TodoCategory: String, CaseIterable {
    case work = "Work"
    case family = "Family"
    case personal = "Personal"
    
    var tintColor: Color {
        switch self {
        case .work:
            return .blue
        case .family:
            return .green
        case .personal:
            return .purple
        default:
            return .yellow
        }
    }
    
}

struct TODOAddSwiftUIView: View {
    @Binding var showAddTodoView: Bool
    @Binding var todos: [Todo]
    @State private var name: String = ""
    @State private var selectedCategory = 0
    
    var body: some View {
        VStack{
            Text("Add Todo").font(.largeTitle)
            TextField("To Do name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black).padding()
            Text("Select Category")
            Picker("",selection: $selectedCategory){
                ForEach(0 ..< TodoCategory.allCases.count) { indice in
                    Text(TodoCategory.allCases[indice].rawValue)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Button {
                self.showAddTodoView = false
                todos.append(Todo(name: name, category: TodoCategory.allCases[selectedCategory]))
            } label: {
                Text("Done")
            }.padding(.top, 20)
        }.padding()
    }
}

struct TODOSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TODOSwiftUIView().previewDevice("iPhone 14 Pro")
    }
}
