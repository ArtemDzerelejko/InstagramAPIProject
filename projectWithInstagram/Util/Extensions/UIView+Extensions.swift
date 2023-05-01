import SwiftUI

struct AlertView: View {
    @Binding var isPresented: Bool
    var title: String
    var message: String?
    var actions: [UIAlertAction]
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            
            if let message = message {
                Text(message)
                    .font(.body)
                    .padding(.top, 8)
            }
            
            Divider()
            
            HStack {
                Spacer()
                
                Button(action: {
                    isPresented = false
                }, label: {
                    Text("OK")
                })
                
                Spacer()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

