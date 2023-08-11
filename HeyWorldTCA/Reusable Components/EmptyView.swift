import SwiftUI

struct EmptyView<Content>: View where Content: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(systemName: "network")
                        .font(.largeTitle)
                        .padding(.bottom, 4)
                    content
                }
                .foregroundColor(Color.gray)
                .padding(.horizontal)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView {
            Text("Empty View")
        }
    }
}
