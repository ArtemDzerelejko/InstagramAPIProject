
import Foundation
import SwiftUI


struct ImageModifiers: ViewModifier {
    var aspectRatio: ContentMode?
    var width: CGFloat?
    var height: CGFloat?
    var paddingEdges: Edge.Set?
    var paddingLength: CGFloat?
    var size: CGFloat?
    var weight: Font.Weight?
    var design: Font.Design?
    
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
