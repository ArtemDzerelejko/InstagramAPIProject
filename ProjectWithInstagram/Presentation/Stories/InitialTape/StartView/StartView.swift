
import SwiftUI

struct StartView: View {
    
    @ObservedObject var startViewModel = StartViewModel()
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                headerView
                Spacer()
                ScrollView {
                    StoriesView()
                    postView
                }.loadingModifier(isLoading: $isLoading)
            }
        }
        .onAppear(perform: startViewModel.uploadingDataForInstagramFeed)
        .navigationBarHidden(true)
    }
    
    private var headerView: some View {
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
    
    private var postView: some View {
        VStack {
            ForEach(startViewModel.posts, id: \.id) { post in
                NavigationLink(destination: PersonalPageView()) {
                    postRowView(post: post)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    private func postRowView(post: DataObject) -> some View {
        
        VStack(alignment: .leading) {
            avatarAndUsername
            AsyncImage(url: URL(string: post.media_url ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                
                panelOfReactionsToThePost
                postDescription
                
            } placeholder: {
                Text(Strings.errorPostNotFound)
            }
            
        }
    }
    
    private var panelOfReactionsToThePost: some View {
        HStack(spacing: 5) {
            Button(action: {}) {
                Image.heartSystem
                    .systemImageModified(size: 20, weight: .bold)
            }
            
            NavigationLink(destination: CommentsView()) {
                Image.messageSystem
                    .systemImageModified(size: 20, weight: .bold)
            }
            
            NavigationLink(destination: DirectView()) {
                Image.paperplaneSystem
                    .systemImageModified(size: 20, weight: .bold)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image.bookmarkSystem
                    .systemImageModified(size: 20, weight: .bold)
            }
        }
    }
    
    private var postDescription: some View {
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
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 5)
    }
    
    private var avatarAndUsername: some View {
        HStack {
            Image.userIcon
                .resizable()
                .imageModified(aspectRatio: .fit, width: 30, height: 30, paddingLength: 5)
                .clipShape(Circle())
            Text(Strings.nameAcountWithUnderscore)
            Spacer()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
