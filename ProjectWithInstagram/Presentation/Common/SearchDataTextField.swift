
import SwiftUI

struct SearchDataTextField: View {
   
    var title: String
    @Binding var text: String
    
    
    var body: some View {
        
        HStack {
            
            TextField(title, text: $text)
                .foregroundColor(Color.black)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .colorMultiply(.lightGray)
            
        }
    }
}

