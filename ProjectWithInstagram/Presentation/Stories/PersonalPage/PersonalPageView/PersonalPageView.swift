
import SwiftUI

struct PersonalPageView: View {
    
    @State var cornerRadius: CGFloat = 7
    @State private var selectedTabIndex = 0
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let imageDimension = UIScreen.main.bounds.width / 3
    
    var body: some View {
        VStack {
            headerView
            ScrollView(.vertical, showsIndicators: false) {
                content
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            Button(action: {}) {
                Text(Strings.nameAcountWithoutUnderscore)
                    .stringsModifiers(size: 20, weight: .heavy, design: .rounded, foregroundColor: .black)
                Spacer()
            }
            .padding(.horizontal)
            .buttonStyle(.plain)
            HStack(spacing: 20) {
                
                Button(action: {}) {
                    Image.plusAppSystem
                        .imageModified(size: 20, weight: .medium, design: .rounded)
                }
                .buttonStyle(.plain)
                
                Button(action: {}) {
                    Image.moreInformation
                        .resizable()
                        .imageModified(width: 20, height: 20)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            HStack {
                StoriesViewButtonWithPlusIcon(action: {}, widthMainImage: 100, heightMainImage: 100, widthPlusImage: 12, heightPlusImage: 12)
                    .padding(.horizontal)
                Spacer()
                HStack(spacing: 32) {
                    VStack(spacing: 2) {
                        Text(Strings.numberOfPosts)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text(Strings.posts)
                            .font(.caption)
                    }
                    VStack(spacing: 2) {
                        Text(Strings.numberOfFollowers)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text(Strings.followers)
                            .font(.caption)
                    }
                    VStack(spacing: 2) {
                        Text(Strings.numberOfFollowing)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text(Strings.following)
                            .font(.caption)
                    }
                }
                Spacer()
            }
            HStack {
                Text(Strings.pseudonym)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                Spacer()
            }
            HStack {
                Button(action: {}) {
                    Text(Strings.edit)
                        .font(.footnote)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(width: 160, height: 28)
                        .background(Color.lightGray)
                        .cornerRadius(cornerRadius)
                }
                .buttonStyle(.plain)
                Button(action: {}) {
                    Text(Strings.shareProfile)
                        .font(.footnote)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(width: 160, height: 28)
                        .background(Color.lightGray)
                        .cornerRadius(cornerRadius)
                }
                .buttonStyle(.plain)
                Button(action: {}) {
                    Image.personBadgePlusSystem
                        .systemImageModified(fontWeight: .medium,
                                             cornerRadius: cornerRadius,
                                             foregroundColor: .black)
                        .frame(width: 35, height: 30)
                        .background(Color.lightGray)
                }
                .buttonStyle(.plain)
            }
            VStack(alignment: .leading) {
                Text(Strings.selectedStories)
                    .font(.footnote)
                    .fontWeight(.medium)
                Text(Strings.saveFavoriteStories)
                    .font(.footnote)
                    .fontWeight(.light)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 9) {
                        StoriesViewButton(action: {},
                                          strokeColor: .gray,
                                          widthFrame: 25,
                                          heightFrame: 25,
                                          backgroundColor: .white,
                                          pictureToDisplayInsideButton: "plus",
                                          foregroundColor: .black,
                                          strokeLineWidth: 1,
                                          textBelowTheButton: Strings.textAddBelowStoriesViewButton)
                        ForEach(0..<6) { _ in
                            StoriesViewButton(action: {},
                                              strokeColor: .white,
                                              widthFrame: 25,
                                              heightFrame: 25,
                                              pictureToDisplayInsideButton: "")
                        }
                    }
                }
                .padding(.vertical, 1)
            }
            .padding(.horizontal)
            HStack(spacing: 35) {
                Spacer()
                Image.squareshapeSplit3x3System
                    .font(.title2)
                Spacer()
                Image.personCropSquareSystem
                    .font(.title2)
                Spacer()
            }
            .padding(.vertical, 1)
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(0..<15, id: \.self) { index in
                    Image.userPosts
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageDimension, height: imageDimension)
                        .border(Color.white)
                        .clipped()
                }
            }
        }
    }
}

struct PersonalPageView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalPageView()
    }
}
