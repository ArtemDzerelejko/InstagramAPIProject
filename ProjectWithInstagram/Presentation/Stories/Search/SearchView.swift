
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
                SearchDataTextFieldView(title: Strings.searchTitle, text: $searchViewModel.searchValue)
                ScrollView {
                    postListView
                }
                .loadingModifier(isLoading: $isLoading)
            }
        }
        .onAppear(perform: searchViewModel.uploadingDataForInstagramFeed)
    }
    

    
    private var postListView: some View {
        
        VStack {
            ForEach(searchViewModel.posts, id: \.id) { post in
                if searchViewModel.searchValue == post.caption {
                    NavigationLink(destination: PersonalPageView()) {
                        postRowView(post: post)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
    
    private func postRowView(post: DataObject) -> some View {
        
        VStack(alignment: .leading) {
           AvatarAndUsernameView()
            AsyncImage(url: URL(string: post.media_url ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                
                PanelOfReactionsToThePostView()
                PostDescriptionView()
                
            } placeholder: {
                Text(Strings.errorPostNotFound)
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
