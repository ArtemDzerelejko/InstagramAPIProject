//
//  ContentView.swift
//  projectWithInstagram
//
//  Created by artem on 25.04.2023.
//

import SwiftUI

struct MainViewController: View {
    
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField(Strings.enterTag, text: $viewModel.searchText)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(LinearGradient(colors: [Color(#colorLiteral(red: 1, green: 0.9759529751, blue: 0.2042095781, alpha: 0.85)), Color(#colorLiteral(red: 0.6136564372, green: 0.7712898172, blue: 1, alpha: 0.85)), Color(#colorLiteral(red: 1, green: 0.4622213878, blue: 0.1943378464, alpha: 0.85))], startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.black)
                    .font(.headline)
                    .cornerRadius(8)
                Button(action: {
                    self.viewModel.generateApi()
                }) {
                    Text(Strings.search)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    self.viewModel.cleanUpText()
                    
                }){
                    Text(Strings.cleanUP)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 32)
            
            NavigationStack{
                    if viewModel.isLoading {
                        ProgressView()
                    } else if viewModel.isError {
                        Text("Error")
                    } else if viewModel.apiResult != nil {
                        List(viewModel.apiResult!.data ?? [], id: \.id) { post in
                            AsyncImage(url: URL(string: post.media_url ?? "")) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                   
                            } placeholder: {
                                Text(Strings.postNotFound)
                            }
                            Text(post.caption ?? "")
                            Text(post.id ?? "")
                        }
                        .listStyle(.plain)
                    }                
            }
            Spacer()
        }
        .background(Color(#colorLiteral(red: 0.8353789241, green: 1, blue: 0.387203351, alpha: 1)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainViewController()
    }
}





//https://scontent.cdninstagram.com/v/t51.29350-15/342716560_908691886912726_4688396961323456826_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8ae9d6&_nc_ohc=9eywEAXtDd0AX_2N1QM&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&oh=00_AfBAFf-_9YK1rfROwIUqYS3rNwx7M6abrDRkQ4V9ls9XDg&oe=644DA4AE
