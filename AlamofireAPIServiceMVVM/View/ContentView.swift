//
//  ContentView.swift
//  AlamofireAPIServiceMVVM
//
//  Created by Fatih Durmaz on 22.03.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = UserViewModel()
    @State private var selectedUser: User? = nil
    
    var body: some View {
        NavigationStack{
            List(viewModel.users) { user in
                NavigationLink(destination: UserDetailView(user: user)){
                    HStack{
                        Text("\(user.id)")
                            .fontWeight(.bold)
                            .padding()
                            .background(.green)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                        VStack(alignment:.leading,spacing: 5){
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                            HStack {
                                Image(systemName: "location.square.fill")
                                Text(user.address.city)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            }
                            
                        }
                    }
                }
                
            }
            .onAppear(perform: viewModel.fetchUsers)
            .navigationTitle("Kullanıcılar")

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
