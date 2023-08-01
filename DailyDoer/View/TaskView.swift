//
//  TaskView.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/27/23.
//

import SwiftUI

struct TaskView: View {
    
    @State private var selection: PickerOption = .first
    
    var body: some View {
        VStack {
            taskLargeTitle
            
            NeubrutalismPicker(firstOption: "Pending", secondOption: "Completed", selection: $selection)
            
            taskList
            
            addTaskButton
        }
        .navigationTitle("DailyDoer")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                trailingToolbarItem
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TaskView()
        }
    }
}

extension TaskView {
    private var taskLargeTitle: some View {
        HStack {
            Text("Tasks")
                .font(.largeTitle)
                .bold()
            
            Spacer()
        }
        .padding(24)
    }
    
    private var trailingToolbarItem: some View {
        NeubrutalismButton(width: 40, height: 40, backgroundColor: Color.theme.orange, action: {
            
        }, label: Image(systemName: "info"))
    }
    
    private var addTaskButton: some View {
        NeubrutalismButton(width: 50, height: 50, backgroundColor: Color.theme.accent, action: {
            
        }, label: Image(systemName: "plus"))
    }
    
    private var taskList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 17) {
                ForEach(0..<10) { _ in
                    TaskTile(taskText: "Do my homework")
                }
            }
            .padding(.top, 15)
            .padding(.horizontal, 24)
        }
    }
}
