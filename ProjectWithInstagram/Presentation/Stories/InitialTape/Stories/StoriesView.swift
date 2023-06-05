
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
        .fullScreenCover(isPresented: $storiesViewModel.isStoryExpanded) {
            StoriesViewFullScreen(show: $storiesViewModel.isStoryExpanded, currentPost: storiesViewModel.currentPost)
        }
        .navigationBarHidden(storiesViewModel.showFullScreen)
    }
}

private struct StoriesScrollView: View {
    @ObservedObject var storiesViewModel: StoriesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 22) {
                storiesViewModel.buttonToAddYourOwnStory()
                ForEach(storiesViewModel.data) { post in
                    storiesViewModel.storyItemView(post: post)
                        .frame(width: 75)
                        .onTapGesture {
                            storiesViewModel.isStoryExpanded.toggle()
                            storiesViewModel.currentPost = post
                            storiesViewModel.creatingAnAnimationForTheSelectedStory(post: post)
                        }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 3)
        }
    }
}
