//
//  ContentView.swift
//  CleanArchictectureDemo
//
//  Created by Jor . on 02/02/2023.
//
//|-- Core
//|-- Data
//|-- Domain
//|__ Presentation
///Core contain diffrent utillity classesutillities that can be used by deifferent modules or base structure
///Also the definations of some extension
///
///Data Layer
///Data model - UI Model, Viewmodel, network, response and entity classes
///Data local - some database classes
///data remote - any class which contains network operation
///data repository- contaions the exposing data to domain layer
///
///Domain Layer - This layer mainly describes what your app/prooject does
///It contains business logic of app
///usescase- single action, eg getting data from database/ doing login/ just fetching one api
///
///Presentation
///Anything related to UI, view, viewcontroller any common views, viewmodel
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel : ProductListViewModel
    @State var isErrorOccured: Bool
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.error != nil{
                    ProgressView().alert(isPresented: $isErrorOccured) {
                        Alert(title:
                                Text(viewModel.error?.localizedDescription ?? "Oops"), message: Text("Something went wrong"), dismissButton: .default(Text("Okay")))
                    }
                }else{
                    List{
                        ForEach(viewModel.products){ product in
                            NavigationLink{
                                EmptyView()
                            }label: {
                                Text(product.title)
                            }
                        }
                    } .padding()
                }
                
            }
            .task {
                await viewModel.getDataForProducts(urlString: APIEndPoint.apiProducts)
                if viewModel.error != nil{
                    isErrorOccured = true
                }
            }.refreshable {
                await viewModel.getDataForProducts(urlString: APIEndPoint.apiProducts)
                if viewModel.error != nil{
                    isErrorOccured = true
                }
            }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ProductListViewModel(repository: ProductListRepositoryImplementation(networkManager: NetworkManager())), isErrorOccured: false)
    }
}
