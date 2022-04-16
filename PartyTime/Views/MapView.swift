//
//  MapView.swift
//  PartyTime
//
//  Created by Carlos Amaral on 11/02/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: -27.591534698843418,
                longitude: -48.52503916008313),
            span: MKCoordinateSpan(
                latitudeDelta: 0,
                longitudeDelta: 0.1)
        )

    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region,
                    showsUserLocation: true,
                    userTrackingMode: .constant(.follow)
                )
                    .edgesIgnoringSafeArea([.top, .horizontal])
                
                VStack(alignment: .leading) {
                    
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<10) { place in
                                SinglePlace()
                            }
                        }
                    }
                }
                .padding([.top, .bottom])
            }
            .navigationTitle("PartyMap")
        }
    }
}

struct SinglePlace : View {
    @State private var isShowingDetails : Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                
                HStack {
                    Text("25 km")
                    Text("|")
                    Text("Rua professor bento águido vieira, 197")
                }
                .font(.footnote)
                .lineLimit(1)
                .foregroundColor(.accentColor)
                .padding(.top, 10)
                .padding(.bottom, 1)
                .padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .center) {
                    Text("Título da festa show de bola")
                        .foregroundColor(.black)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .lineLimit(2)
                    
                    HStack {
                        Text("03/06")
                        Text("|")
                        Text("19 hrs")
                    }
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                }
                .padding(.vertical, 30)
                
                Button {
                    isShowingDetails.toggle()
                } label: {
                    Text("Quero ir!")
                        .foregroundColor(.white)
                        .font(.callout)
                }
                .padding(5)
                .padding(.horizontal, 50)
                .background(.indigo)
                .cornerRadius(5)
                
                
                Spacer()
            }
        }
        .frame(width: 220 ,height: 220)
        .background(.white)
        .cornerRadius(15)
        .padding(5)
        .sheet(isPresented: $isShowingDetails) {
            PartyDetailsView()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
