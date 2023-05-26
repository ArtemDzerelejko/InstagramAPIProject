
import SwiftUI
import Combine

class StoriesViewModel: ObservableObject {
    
    @Published var showFullScreen = false
    @Published var currentPost: Post?
    @Published var isStoryExpanded = false
    @Published var data = [
        Post(id: 0, name: DataForStoriesView.name1, url: "story1", seen: false, proPic: "thumb1", loading: false),
        Post(id: 1, name: DataForStoriesView.name2, url: "story2", seen: false, proPic: "thumb2", loading: false),
        Post(id: 2, name: DataForStoriesView.name3, url: "story3", seen: false, proPic: "thumb3", loading: false),
        Post(id: 3, name: DataForStoriesView.name4, url: "story4", seen: false, proPic: "thumb4", loading: false),
        Post(id: 4, name: DataForStoriesView.name5, url: "story5", seen: false, proPic: "thumb5", loading: false)
    ]
    
    func buttonToAddYourOwnStory() -> some View {
        StoriesViewButtonWithPlusIcon(action: {}, textUnderButton: Strings.you, widthMainImage: 65, heightMainImage: 65, widthPlusImage: 12, heightPlusImage: 12)
    }
    
    func storyItemView(post: Post) -> some View {
        
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
    
    func creatingAnAnimationForTheSelectedStory(post: Post) {
        
        guard let index = data.firstIndex(where: { $0.id == post.id }) else {
            return
        }
        
        withAnimation(Animation.default.speed(0.35).repeatForever(autoreverses: false)) {
            data[index].loading.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + (data[index].seen ? 0 : 1.2)) {
                withAnimation(.default) {
                    self.currentPost = self.data[index]
                    self.showFullScreen.toggle()
                }
                
                self.data[index].loading = false
                self.data[index].seen = true
            }
        }
    }
}
