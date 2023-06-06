
import SwiftUI

struct SearchView: View {
    @StateObject private var searchViewModel = SearchViewModel()
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let imageDimension = UIScreen.main.bounds.width / 3
    @State private var isLoading = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                SearchDataTextFieldView(title: Strings.searchTitle, text: $searchViewModel.searchValue)
                ScrollView {
                    PostListView(searchViewModel: searchViewModel)
                }
                .loadingModifier(isLoading: $isLoading)
            }
        }
        .onAppear(perform: searchViewModel.uploadingDataForInstagramFeed)
    }
}

private struct PostListView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    
    var body: some View {
        
        VStack {
            
            ForEach(searchViewModel.posts, id: \.id) { post in
                if searchViewModel.searchValue == post.caption {
                    NavigationLink(destination: PersonalPageView()) {
                        PostRowView(post: post)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

private struct PostRowView: View {
    var post: DataObject
    
    var body: some View {
        
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
