
import SwiftUI

struct SearchView: View {
    @StateObject private var searchViewModel = SearchViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let imageDimension = UIScreen.main.bounds.width / 3
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    SearchDataTextField(title: Strings.searchTitle, text: $searchViewModel.searchValue)
                }
                ScrollView {

                    VStack {
                        ForEach(searchViewModel.posts, id: \.id) { post in
                            if searchViewModel.searchValue == post.caption {
                                NavigationLink(destination: PersonalPageView()) {
                                    
                                    HStack {
                                        Image.userIcon
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                            .padding(.horizontal, 5)
                                        
                                        Text(Strings.nameAcountWithUnderscore)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                }.buttonStyle(.plain)
                                
                                
                                AsyncImage(url: URL(string: post.media_url ?? "")) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    Text(Strings.postNotFound)
                                }
                                
                                HStack(spacing: 5) {

                                    Button(action: {}) {
                                        Image.heartSystem
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .foregroundColor(.black)
                                            .padding(.horizontal, 5)
                                            .padding(.vertical, 2)
                                    }.buttonStyle(.plain)

                                    NavigationLink(destination: CommentsView()) {
                                        
                                        Image.messageSystem
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .foregroundColor(.black)
                                            .padding(.horizontal, 5)
                                            .padding(.vertical, 2)
                                    }.buttonStyle(.plain)
                                    
                                    NavigationLink(destination: DirectView()) {
                                        
                                        Image.paperplaneSystem
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .foregroundColor(.black)
                                            .padding(.horizontal, 5)
                                            .padding(.vertical, 2)
                                    }.buttonStyle(.plain)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Button(action: {}) {
                                            Image.bookmarkSystem
                                                .font(.system(size: 20, weight: .bold, design: .default))
                                                .foregroundColor(.black)
                                                .padding(.horizontal, 5)
                                                .padding(.vertical, 2)
                                        }.buttonStyle(.plain)
                                    }
                                }
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(Strings.numberOfLikes)
                                        .font(.system(size: 15, weight: .medium, design: .default))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(Strings.nameAcountWithUnderscore + " " + Strings.someInformation)
                                        .font(.system(size: 15, weight: .medium, design: .default))
                                    
                                    NavigationLink(destination: CommentsView()) {
                                        Text(Strings.viewAllCommentsLabel + "( \(Strings.numberOfComments))")
                                            .font(.system(size: 15, weight: .medium, design: .default))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Text(Strings.someTimeAgoLabel)
                                        .font(.system(size: 12, weight: .medium, design: .default))
                                        .foregroundColor(.gray)
                                }.padding(.horizontal, 5)
                                
                            }
                        }
                    }
                }.loadingModifier(isLoading: $isLoading)
            }
        }
        .onAppear(perform: searchViewModel.uploadingDataForInstagramFeed)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

