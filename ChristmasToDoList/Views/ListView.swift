//
//  ListView.swift
//  ChristmasToDoList
//
//  Created by Valentina Muñoz on 07-12-24.
//

import SwiftUI

struct ListView: View {
    
    @State private var tasks: [String] = [
        "Comprar regalos",
        "Hornear galletas",
        "Decorar el árbol"]

    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()

            VStack(spacing: 20) { // Ajusta el espaciado
                Image("christmas-3")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                
                Text("Lista de Tareas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Desliza hacia la izquierda para eliminar una tarea.")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))

                List {
                    ForEach(tasks, id: \.self) { task in
                        Text("🎄 \(task)")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                            .padding(.vertical, 4)
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(InsetGroupedListStyle())
                .scrollContentBackground(.hidden)
                
                Spacer()

                NavigationLink(destination: AddTaskView(tasks: $tasks)) {
                    Text("Agregar tarea")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 20)
                        .background(
                            LinearGradient(
                                colors: [Color.green, Color.blue],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                }
                .padding()
            }
        }
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ListView()
}
