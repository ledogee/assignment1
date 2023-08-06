////
////  MapView.swift
////  assignment1
////
////  Created by Bao Luong Gia on 06/08/2023.
////
//
//import SwiftUI
//import MapKit
///* map view for each item in detailed view */
//struct Place: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//}
//
//struct MapView: View {
//    var song: Song
//    var coordinates: CLLocationCoordinate2D
//
//    @State private var region = MKCoordinateRegion()
//
//
//    var body: some View {
//        let annotations = [
//            Place(name: song.artist, coordinate: song.locationCoordinate)
//        ]
//        Map(coordinateRegion: $region, annotationItems: annotations) {Place in MapAnnotation(coordinate: song.locationCoordinate) {
//            VStack {
////                Text("\(anime.details.studioName)")
//                Image(systemName: "mappin.circle.fill").resizable().foregroundColor(.red).frame(width: 20, height: 20)
//            }
//        }}.onAppear {
//            setRegion(coordinates)
//        }
//    }
//
//    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
//        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0006, longitudeDelta: 0.0006))
//    }
//}
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(song: songs[0], coordinates: CLLocationCoordinate2D(latitude: 34.011_0286, longitude: -116.166_868))
//    }
//}
