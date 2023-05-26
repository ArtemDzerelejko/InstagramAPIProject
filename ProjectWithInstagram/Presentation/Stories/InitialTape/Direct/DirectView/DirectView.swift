
import SwiftUI

struct DirectView: View {
    
    @StateObject private var directViewModel = DirectViewModel()
    
    var body: some View {
        
        VStack {
            
            ScrollView(showsIndicators: false) {
                
                VStack {
                    
                    HStack {
                        
                        SearchDataTextField(title: Strings.searchTitle, text: $directViewModel.searchValue)
                    }
                    
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
                    
                    HStack {
                        
                        Button(action: {}) {
                            Text(Strings.messageLabel)
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
                    
                    ForEach(0..<100) { _ in
                        SendMessageButton(actionForMainButton: {}, actionForStoriesViewButton: {},  actionForCameraButton: {})
                    }
                    .padding(.vertical, -16)
                    
                }
            }
        }
        
        .navigationBarItems(leading: HStack {
            
            Button(action: {}) {
                Text(Strings.nameAcountWithoutUnderscore)
                    .stringsModifiers(size: 20, weight: .heavy, design: .rounded, foregroundColor: .black, paddingLength: -20)
            }
        }) .buttonStyle(.plain)
        
            .navigationBarItems(trailing: HStack {
                
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
            })
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        DirectView()
    }
}
