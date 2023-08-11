import SwiftUI

struct ErrorView: View {
    let error: HeyWorldError
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text(error.errorDescription)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.bottom, 4)
                    
                    Text("Try refreshing the page.")
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
                .foregroundColor(Color.gray)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: HeyWorldError.unknownError)
    }
}
