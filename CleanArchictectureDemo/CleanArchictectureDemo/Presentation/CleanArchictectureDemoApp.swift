//
//  CleanArchictectureDemoApp.swift
//  CleanArchictectureDemo
//
//  Created by Jor . on 02/02/2023.
//

import SwiftUI

@main
struct CleanArchictectureDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ProductListViewModel(repository: ProductListRepositoryImplementation(networkManager: NetworkManager())), isErrorOccured: false)
        }
    }
}
