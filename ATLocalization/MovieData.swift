//
//  MovieData.swift
//  ATLocalization
//
//  Created by Felix ITs 01 on 14/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

import UIKit

class MovieData: NSObject {
    
    var title : String = String()
    var cast : String = String()
    var released : String = String()
    var runtime : String = String()
    var plot : String = String()
    var year : String = String()
    var rated : String = String()
    var director : String = String()
    var writer : String = String()
    var genre : String = String()
    
    init(title: String, year : String, rated : String, released : String, runtime : String, genre : String, director : String, writer : String, cast : String, plot : String) {
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.cast = cast
        self.plot = plot
    }
}
