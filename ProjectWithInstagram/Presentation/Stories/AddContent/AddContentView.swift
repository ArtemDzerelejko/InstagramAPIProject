
import SwiftUI
import UIKit

struct AddContentView: View {
    
    @StateObject private var addContentViewModel = AddContentViewModel()
    @State private var showGalleryPicker = false
    @State private var showCameraPicker = false
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let imageDimension = UIScreen.main.bounds.width / 3
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    navigationBar
                    contentView
                }
                
            }
        }
    }
    
    private var navigationBar: some View {
        HStack {
            Button(action: {}) {
                Image.xmarkSystem
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
            }
            .buttonStyle(.plain)
            .padding(.horizontal)
            
            HStack(alignment: .center) {
                Spacer()
                Text(Strings.newPost)
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                Spacer()
            }
            
            Button(action: {}) {
                Text(Strings.further)
                    .foregroundColor(.blue)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
            }
            .buttonStyle(.plain)
            .padding(.horizontal)
            Spacer()
        }
    }
    
    private var contentView: some View {
        VStack {
            if let image = addContentViewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Image.pictureThatIsDisplayedWhenTheScreenIsOpen
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            navigationButtonsWhenAddingNewPost
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(0 ..< 100, id: \.self) { index in
                        Image.pictureForANewPost
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
    
    private var navigationButtonsWhenAddingNewPost: some View {
        HStack {
            Button(action: {}) {
                Text(Strings.recent)
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            .buttonStyle(.plain)
            
            Button(action: { showGalleryPicker.toggle() }) {
                Image.photoSystem
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.white)
                    .padding(7)
                    .background(Color.gray)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            .fullScreenCover(isPresented: $showGalleryPicker) {
                ImagePickerView(selectedImage: $addContentViewModel.selectedImage, sourceType: .photoLibrary)
            }
            
            Button(action: { showCameraPicker.toggle() }) {
                Image.cameraSystem
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.white)
                    .padding(7)
                    .background(Color.gray)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            .fullScreenCover(isPresented: $showCameraPicker) {
                ImagePickerView(selectedImage: $addContentViewModel.selectedImage, sourceType: .camera)
            }
        }
    }
}


struct AddContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddContentView()
    }
}
