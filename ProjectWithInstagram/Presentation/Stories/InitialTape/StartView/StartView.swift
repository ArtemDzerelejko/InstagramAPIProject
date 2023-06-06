
import SwiftUI

struct StartView: View {
    
    @ObservedObject var startViewModel = StartViewModel()
    @State private var isLoading = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HeaderView()
                Spacer()
                
                ScrollView {
                    StoriesView()
                    postView
                }
                .loadingModifier(isLoading: $isLoading)
            }
        }
        .onAppear(perform: startViewModel.uploadingDataForInstagramFeed)
        .navigationBarHidden(true)
    }
    
    private var postView: some View {
        PostView(startViewModel: startViewModel)
    }
    
}

private struct HeaderView: View  {
    var body: some View {
        
        HStack {
            
            Button(action: {}) {
                Text(Strings.instagramTitle)
                
                    .foregroundColor(.black)
                    .font(.billabong)
                    .padding(.horizontal)
            }
            Spacer()
            
            HStack(spacing: 20) {
                
                NavigationLink(destination: LikeView()) {
                    Image.heartSystem
                        .systemImageModified(size: 20, weight: .bold)
                }
                
                NavigationLink(destination: DirectView()) {
                    Image.messageSystem
                        .systemImageModified(size: 20, weight: .bold)
                }
                .transition(.move(edge: .leading))
                .navigationBarTitle("")
            }
            .padding(.horizontal)
        }
    }
}

private struct PostView: View {
    @ObservedObject var startViewModel: StartViewModel
    
    var body: some View {
        VStack {
            ForEach(startViewModel.posts, id: \.id) { post in
                Button(action: {}) {
                    PostRowView(post: post)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

private struct PostRowView: View {
    let post: DataObject
    
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
