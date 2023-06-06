
import SwiftUI
import Combine

class StoriesViewModel: ObservableObject {
    @Published var showFullScreen = false
    @Published var currentPost: Post?
    @Published var data = [
        Post(id: 0, name: DataForStoriesView.name1, url: "story1", seen: false, proPic: "thumb1", loading: false),
        Post(id: 1, name: DataForStoriesView.name2, url: "story2", seen: false, proPic: "thumb2", loading: false),
        Post(id: 2, name: DataForStoriesView.name3, url: "story3", seen: false, proPic: "thumb3", loading: false),
        Post(id: 3, name: DataForStoriesView.name4, url: "story4", seen: false, proPic: "thumb4", loading: false),
        Post(id: 4, name: DataForStoriesView.name5, url: "story5", seen: false, proPic: "thumb5", loading: false)
    ]
    
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
