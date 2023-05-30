
import Foundation
import SwiftUI

struct LoadingModifier: ViewModifier {
    
    @Binding var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                ProgressView()
                    .scaleEffect(2.0, anchor: .center)
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}

struct SystemImageModifier: ViewModifier {
    var size: CGFloat?
    var weight: Font.Weight?
    var design: Font.Design?
    var fontWeight: Font.Weight?
    var cornerRadius: CGFloat?
    var foregroundColor: Color?
    func body(content: Content) -> some View {
        content
            .font(.system(size: size ?? 17, weight: weight, design: design))
            .foregroundColor(.black)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .fontWeight(fontWeight)
            .cornerRadius(cornerRadius ?? 0)
            .foregroundColor(foregroundColor)
    }
}

struct StringsModifiers: ViewModifier {
    var size: CGFloat?
    var weight: Font.Weight?
    var design: Font.Design?
    var foregroundColor: Color?
    var paddingEdges: Edge.Set?
    var paddingLength: CGFloat?
    var lineLimit: Int?
    func body(content: Content) -> some View {
        content
            .font(.system(size: size ?? 10, weight: weight, design: design))
            .foregroundColor(foregroundColor)
            .padding(paddingEdges ?? .horizontal, paddingLength)
            .lineLimit(lineLimit)
    }
}

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
    func loadingModifier(isLoading: Binding<Bool>) -> some View {
        modifier(LoadingModifier(isLoading: isLoading))
    }
    
    func stringsModifiers(size: CGFloat? = nil, weight: Font.Weight? = nil, design: Font.Design? = nil, foregroundColor: Color? = nil, paddingEdges: Edge.Set? = nil, paddingLength: CGFloat? = nil, lineLimit: Int? = nil) -> some View {
        modifier(StringsModifiers(size: size, weight: weight, design: design, foregroundColor: foregroundColor, paddingEdges: paddingEdges, paddingLength: paddingLength, lineLimit: lineLimit))
    }
    
    func systemImageModified(size: CGFloat? = nil, weight: Font.Weight? = nil, design: Font.Design? = nil, fontWeight: Font.Weight? = nil, cornerRadius: CGFloat? = nil, foregroundColor: Color? = nil) -> some View {
        modifier(SystemImageModifier( size: size, weight: weight, design: design, fontWeight: fontWeight, cornerRadius: cornerRadius, foregroundColor: foregroundColor))
    }
    
    func imageModified(aspectRatio: ContentMode? = nil, width: CGFloat? = nil, height: CGFloat? = nil, paddingEdges: Edge.Set? = nil, paddingLength: CGFloat? = nil, size: CGFloat? = nil, weight: Font.Weight? = nil, design: Font.Design? = nil) -> some View {
        modifier(ImageModifiers(aspectRatio: aspectRatio, width: width, height: height, paddingEdges: paddingEdges, paddingLength: paddingLength, size: size, weight: weight, design: design))
    }
}
