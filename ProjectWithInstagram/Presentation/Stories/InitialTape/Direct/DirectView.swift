
import SwiftUI

struct DirectView: View {
    
    @StateObject private var directViewModel = DirectViewModel()
    
    var body: some View {
        
        VStack {
            Content()
        }
        .navigationBarItems(leading: NavigationLeadingItems())
        .navigationBarItems(trailing: NavigationTrailingItems())
    }
}

private struct Content: View {
    @StateObject private var directViewModel = DirectViewModel()
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack {
                SearchDataTextFieldView(title: Strings.searchTitle, text: $directViewModel.searchValue)
                StoriesViews()
                MessageSection()
                Messages()
            }
        }
    }
}

private struct StoriesViews: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 28) {
                
                StoriesViewButton(action: {}, strokeColor: .black, widthFrame: 25, heightFrame: 25, backgroundColor: .white, foregroundColor: .black, showSecond: true)
                
                ForEach(0..<6) { _ in
                    StoriesViewButton(action: {}, widthFrame: 25, heightFrame: 25)
                    
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
        }
    }
}

private struct MessageSection: View {
    var body: some View {
        
        HStack {
            
            Button(action: {}) {
                Text(Strings.message)
                    .stringsModifiers(size: 17, weight: .semibold, design: .rounded, foregroundColor: .black)
                Spacer()
            }
            .buttonStyle(.plain)
            
            HStack {
                
                Button(action: {}) {
                    Text(Strings.requestsLabel)
                        .stringsModifiers(size: 15, weight: .heavy, design: .rounded, foregroundColor: .gray)
                }
            }
        }
    }
}

private struct Messages: View {
    var body: some View {
        ForEach(0..<100) { _ in
            SendMessageButton(actionForMainButton: {}, actionForStoriesViewButton: {},  actionForCameraButton: {})
        }
        .padding(.vertical, -16)
    }
}

private struct NavigationLeadingItems: View {
    var body: some View {
        
        HStack {
            
            Button(action: {}) {
                Text(Strings.nameAcountWithoutUnderscore)
                    .stringsModifiers(size: 20, weight: .heavy, design: .rounded, foregroundColor: .black, paddingLength: -20)
            }
        }
        .buttonStyle(.plain)
    }
}

private struct NavigationTrailingItems: View {
    var body: some View {
        
        HStack {
            
            Button(action: {}) {
                Image.videoBadgePlusSystem
                    .systemImageModified(weight: .medium, design: .rounded)
            }
            .buttonStyle(.plain)
            Button(action: {}) {
                Image.squareAndPencilSystem
                    .systemImageModified(size: 17, weight: .medium, design: .rounded)
            }
            .buttonStyle(.plain)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        DirectView()
    }
}
