
import SwiftUI

struct StartView: View {
    
    @StateObject var startViewModel = StartViewModel()
    @State private var isLoading = false
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    Button(action: {}) {
                        Text(Strings.instagramLabel)
                            .foregroundColor(.black)
                            .font(.billabong)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        
                        NavigationLink(destination: LikeView()) {
                            Image.heartSystem
                                .systemImageModified(weight: .medium)
                        }
                        
                        NavigationLink(destination: DirectView()) {
                            Image.messageSystem
                                .systemImageModified(weight: .medium)
                        }
                        .transition(.move(edge: .leading))
                        .navigationBarTitle("")
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                
                ScrollView {
                    
                    StoriesView()
                    
                    VStack {
                        ForEach(startViewModel.posts, id: \.id) { post in
                            NavigationLink(destination: PersonalPageView()) {
                                HStack {
                                    Image.userIcon
                                        .resizable()
                                    
                                        .imageModified(aspectRatio: .fit,
                                                       width: 30,
                                                       height: 30, paddingLength: 5)
                                       
                                        
                                        .clipShape(Circle())
                                       
                                    
                                    Text(Strings.nameAcountWithUnderscore)
                                    Spacer()
                                    
                                }
                            }.buttonStyle(.plain)
                            
                            AsyncImage(url: URL(string: post.media_url ?? "")) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Text(Strings.postNotFound)
                            }
                            
                            HStack(spacing: 5) {
                                
                                Button(action: {}) {
                                    Image.heartSystem
                                        .systemImageModified()
                                }.buttonStyle(.plain)
                                
                                NavigationLink(destination: CommentsView()) {
                                    
                                    Image.messageSystem
                                        .systemImageModified()
                                }.buttonStyle(.plain)
                                
                                NavigationLink(destination: DirectView()) {
                                    
                                    Image.paperplaneSystem
                                        .systemImageModified()
                                }.buttonStyle(.plain)
                                
                                Spacer()
                                
                                HStack {
                                    
                                    Button(action: {}) {
                                        Image.bookmarkSystem
                                            .systemImageModified()
                                    }.buttonStyle(.plain)
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                
                                Text(Strings.numberOfLikes)
                                    .stringsModifiers(size: 15,
                                                      weight: .medium,
                                                      design: .default)
//                                     .font(.system(size: 15, weight: .medium, design: .default))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(Strings.nameAcountWithUnderscore + " " + Strings.someInformation)
                                    .stringsModifiers(size: 15,
                                                      weight: .medium,
                                                      design: .default)
                                
                                NavigationLink(destination: CommentsView()) {
                                    Text(Strings.viewAllCommentsLabel + "( \(Strings.numberOfComments))")
                                        .stringsModifiers(size: 15,
                                                          weight: .medium,
                                                          design: .default,
                                                          foregroundColor: .gray)
                                        
                                }
                                
                                Text(Strings.someTimeAgoLabel)
                                    .stringsModifiers(size: 12,
                                                      weight: .medium,
                                                      design: .default,
                                                      foregroundColor: .gray)
                                    
                                
                            }.padding(.horizontal, 5)
                            
                        }
                    }
                }.loadingModifier(isLoading: $isLoading)
            }
        }
        
        .onAppear(perform: startViewModel.uploadingDataForInstagramFeed)
        .navigationBarHidden(true)
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
