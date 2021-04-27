//
//  MoviesView.swift
//  ZMovies
//
//  Created by Zin Lin Htet Naing on 16/03/2021.
//

import SwiftUI

struct MoviesView: View {
    
    @State private var searchTerm = ""
    @State private var selectionIndex = 0
    @State private var tabs = ["Now Playing", "Upcoming", "Trending"]
    
    @ObservedObject var movieManager = MovieDownloadManager()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().tintColor = .systemBlue
        UINavigationBar.appearance().barTintColor = .orange
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemBlue
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemBlue], for: .normal)
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(tabs[selectionIndex])
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.top)
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .font(.system(size: 25, weight: .regular))
                        .foregroundColor(.blue)
                    TextField("Search...", text: $searchTerm)
                        .padding(20)
                        .frame(height: 40)
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(Color.gray.opacity(0.08))
                        .cornerRadius(20)
                }.padding(.vertical, 10)
            }.padding(.horizontal)
            //SegmentControl
            VStack {
                Picker("", selection: $selectionIndex) {
                    ForEach(0..<tabs.count) { index in
                        Text(tabs[index])
                            .font(.title)
                            .bold()
                            .tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .onChange(of: selectionIndex) { (_) in
                    switch selectionIndex {
                    case 0:
                        movieManager.getNowPlaying()
                    case 1:
                        movieManager.getUpcoming()
                    default:
                        movieManager.getPopular()
                    }
                }
            }.padding(.top, 0)
            .padding(.horizontal, 20)
            //List
            List {
                ForEach(movieManager.movies.filter { searchTerm.isEmpty ? true : $0.title?.lowercased().localizedStandardContains(searchTerm.lowercased()) ?? true }) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieCell(movie: movie)
                    }.listRowBackground(Color.clear)
                }
            }.onAppear {
                movieManager.getNowPlaying()
            }
            Spacer()
        }
    }
}


struct Movies_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
