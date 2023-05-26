
import SwiftUI

struct StoriesViewFullScreen: View {
    
    @Binding var show: Bool
    var currentPost: Post?
    
    var body: some View {
        
        if show {
            ZStack {
                
                Color.black.edgesIgnoringSafeArea(.all)
                
                if let currentPost = currentPost {
                    ZStack(alignment: .topLeading) {
                        
                        GeometryReader { _ in
                            VStack {
                                Image(currentPost.url)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        VStack(spacing: 15) {
                            
                            LoaderForStories(show: $show)
                            HStack(spacing: 15) {
                                
                                Image(currentPost.proPic)
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                    .clipShape(Circle())
                                Text(currentPost.name)
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
                } else {
                    Text(Strings.errorNoCurrentPost)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
