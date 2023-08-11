import SwiftUI

struct CountryDetailElementView: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.caption2)
                .foregroundColor(Color.gray)
            Text(value)
        }
        .padding(.vertical, 4)
    }
}

struct CountryDetailElementView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailElementView(label: "Code", value: "AE")
    }
}

