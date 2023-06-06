
import Foundation
import SwiftUI

struct ImageModifiers: ViewModifier {
    @State var aspectRatio: ContentMode?
    @State var width: CGFloat?
    @State var height: CGFloat?
    @State var paddingEdges: Edge.Set?
    @State var paddingLength: CGFloat?
    @State var size: CGFloat?
    @State var weight: Font.Weight?
    @State var design: Font.Design?
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: aspectRatio ?? .fit)
            .frame(width: width, height: height)
            .padding(paddingEdges ?? .horizontal, paddingLength)
            .font(.system(size: size ?? 17, weight: weight, design: design))
        
    }
}


extension View {
    func imageModified(aspectRatio: ContentMode? = nil, width: CGFloat? = nil, height: CGFloat? = nil, paddingEdges: Edge.Set? = nil, paddingLength: CGFloat? = nil, size: CGFloat? = nil, weight: Font.Weight? = nil, design: Font.Design? = nil) -> some View {
        modifier(ImageModifiers(aspectRatio: aspectRatio, width: width, height: height, paddingEdges: paddingEdges, paddingLength: paddingLength, size: size, weight: weight, design: design))
    }
}
