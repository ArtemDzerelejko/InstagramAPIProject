
import SwiftUI

struct StoriesViewFullScreen: View {
    @Binding var show: Bool
    var currentPost: Post?
    
    var body: some View {
        if show {
            
            ZStack {
                
                Color.black.edgesIgnoringSafeArea(.all)
                
                if let currentPost = currentPost {
                    StoryContentView(show: $show, post: currentPost)
                } else {
                    Text(Strings.errorNotFoundCurrentPost)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

private struct StoryContentView: View {
    @Binding var show: Bool
    let post: Post
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            GeometryReader { _ in
                
                VStack {
                    
                    Image(post.url)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            
            VStack(spacing: 15) {
                
                LoaderForStories(show: $show)
                
                HStack(spacing: 15) {
                    
                    Image(post.proPic)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                    Text(post.name)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.leading)
            }
            .padding(.top)
        }
        .transition(.move(edge: .trailing))
        .onTapGesture {
            withAnimation(.default) {
                show = false
            }
        }
    }
}

