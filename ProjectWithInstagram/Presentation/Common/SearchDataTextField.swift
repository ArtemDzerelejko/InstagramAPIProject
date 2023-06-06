
import SwiftUI

struct SearchDataTextField: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        TextField(title, text: $text)
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
