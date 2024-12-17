//
//  AddTaskView.swift
//  ChristmasToDoList
//
//  Created by Valentina Muñoz on 07-12-24.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var tasks: [String]
    @State private var newTask: String = ""
    @State private var showAlert: Bool = false

    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .padding(.top)

                Text("Agregar Nueva Tarea 🎄")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                HStack {
                    Image(systemName: "text.cursor")
                        .foregroundColor(.gray)

                    TextField("Escribe tu tarea aquí...", text: $newTask)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)

                Spacer()
                
                Button(action: addTask) {
                    Text("Agregar Tarea")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(colors: [Color.green, Color.blue], startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                }
                .padding(.horizontal, 40)
                .alert(isPresented: $showAlert) { // Muestra una alerta
                    Alert(
                        title: Text("¡Tarea agregada!"),
                        message: Text("Vuelve al listado para ver tu nueva tarea."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
        .navigationTitle("Nueva Tarea 🎁")
    }

    func addTask() {
        if !newTask.isEmpty {
            tasks.append(newTask) // Agrega la nueva tarea
            newTask = "" // Limpia el campo
            showAlert = true // Muestra la alerta
        }
    }
}


#Preview {
    @State var previewTasks: [String] = ["Prueba de tarea 1", "Prueba de tarea 2"]
    
    return AddTaskView(tasks: .constant(previewTasks))
}
