import SwiftUI

struct StoriesView: View {
    @StateObject private var storiesViewModel = StoriesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.clear.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                StoriesScrollView(storiesViewModel: storiesViewModel)
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $storiesViewModel.showFullScreen) {
            StoriesViewFullScreen(show: $storiesViewModel.showFullScreen, currentPost: storiesViewModel.currentPost)
        }
        .navigationBarHidden(storiesViewModel.showFullScreen)
    }
}

private struct StoriesScrollView: View {
    @ObservedObject var storiesViewModel: StoriesViewModel
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 22) {
                
                buttonToAddYourOwnStory()
                ForEach(storiesViewModel.data) { post in
                    storyItemView(post: post)
                        .frame(width: 75)
                        .onTapGesture {
                            storiesViewModel.creatingAnAnimationForTheSelectedStory(post: post)
                        }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 3)
        }
    }
    
    private func buttonToAddYourOwnStory() -> some View {
        StoriesViewButtonWithPlusIcon(action: {}, textUnderButton: Strings.youLabel, widthMainImage: 65, heightMainImage: 65, widthPlusImage: 12, heightPlusImage: 12)
    }
    
    private func storyItemView(post: Post) -> some View {
        
        VStack(spacing: 8) {
            
            ZStack {
                
                Image(post.proPic)
                    .resizable()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                if !post.seen {
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(
                            AngularGradient(gradient: .init(colors: [.red, .orange, .red]), center: .center),
                            style: StrokeStyle(lineWidth: 4, dash: [post.loading ? 7 : 0])
                        )
                        .frame(width: 74, height: 74)
                        .rotationEffect(.init(degrees: post.loading ? 360 : 0))
                }
            }
            
            Text(post.name)
                .foregroundColor(.black)
                .lineLimit(1)
        }
    }
}
