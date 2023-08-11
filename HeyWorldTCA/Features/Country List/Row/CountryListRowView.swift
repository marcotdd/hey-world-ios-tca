import SwiftUI

struct CountryListRowView: View {
    let country: any CountryProtocol
    
    var body: some View {
        VStack {
            HStack {
                Text(country.flag)
                    .frame(width: 32)
                    .font(.title)
                Text(country.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 4)
            .font(.title3)
        }
    }
}

struct CountryListRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListRowView(country: CountryLight.mokedElement)
    }
}
