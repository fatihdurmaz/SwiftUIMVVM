//
//  UserDetailView.swift
//  AlamofireAPIServiceMVVM
//
//  Created by Fatih Durmaz on 22.03.2023.
//

import SwiftUI
import MapKit

struct UserDetailView: View {
    let user: User
    
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Kullanıcı Bilgisi")) {
                    Text("İsim: \(user.name)")
                    Text("Kullanıcı Adı: \(user.username)")
                    Text("Email: \(user.email)")
                }
                Section(header: Text("Adres Bilgisi")) {
                    Text("Cadde: \(user.address.street)")
                    Text("Şehir: \(user.address.city)")
                    Text("Posta Kodu: \(user.address.zipcode)")
                    
                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: user.address.geo.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))), annotationItems: [user]) { user in
                        MapMarker(coordinate: user.address.geo.coordinate, tint: .white)
                        
                    }
                    .frame(height: 200)
                }
                Section(header: Text("İletişim Bilgisi")) {
                    Text("Telefon: \(user.phone)")
                    Text("Website: \(user.website)")
                }
                Section(header: Text("Şirket Bilgisi")) {
                    Text("İsim: \(user.company.name)")
                    Text("Slogan: \(user.company.catchPhrase)")
                    Text("Sektör: \(user.company.bs)")
                }
            }
            .navigationTitle("Kullanıcı Detayları")
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(id: 1, name: "Fatih Durmaz", username: "fdurmaz", email: "fatih.durmaz@outlook.com", address: Address(street: "Selami Atabey", suite: "TEDAŞ Lojmanları", city: "Ankara", zipcode: "06830", geo: Geo(lat:"" , lng:"" )), phone: "0537000000", website: "yuumamobile.com", company: Company(name: "TEDAŞ", catchPhrase: "Sloganımız tedaş aydınlatır", bs: "Enerji Sektörü")))
    }
}
