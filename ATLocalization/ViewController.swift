//
//  ViewController.swift
//  ATLocalization
//
//  Created by Felix ITs 01 on 14/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

import UIKit
import SwiftyJSON
let kDownloadMovieDataNotificationIdentifier : String = "Download Movie Data"
let kRequestURL : String = "http://www.omdbapi.com/?t=inception&y=&plot=short&r=json"
let kCellIdentifiers : [String] = ["title","info","run","direct","cast","genre","plot"]

class ViewController: UIViewController {

    var movieSearchString : String = String()
    
    @IBOutlet weak var imageViewLanguage: UIImageView!
    
    @IBOutlet weak var tableViewInfo: UITableView!
    

    @IBOutlet weak var textFieldSearchMovie: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setLanguage()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.downloadMovieDataNotifies(_:)), name: kDownloadMovieDataNotificationIdentifier, object: movieSearchString)
        
    }
    
    func downloadMovieDataNotifies(note : NSNotification) {
        
        let movieName : String = note as! String
        print(movieName)
        
        downloadMovieData(name: movieName)
    }
    
    func downloadMovieData(name name: String) {
        
        let query : String = name.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        let urlString : String = "http://www.omdbapi.com/?t=\(query)&y=&plot=short&r=json"
        
        let url : NSURL = NSURL.init(string: urlString)!
        
        let data : NSData = NSData.init(contentsOfURL: url)!
        
        let json = JSON.init(data: data)
        let release : String = json["Released"].stringValue
        print(release)
        
        
        
        
        
        
    }
    
    func setLanguage() {
        imageViewLanguage.image = UIImage.init(named: "flag")
    }
    
    func changeLanguage() {
        
        var language : String = String()
        
        print("Language changed to %@",language)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeLanguageButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func searchMovieButtonTapped(sender: AnyObject) {
        
        downloadMovieFromTextField(textFieldSearchMovie)
    }
    
    func downloadMovieFromTextField(textField: UITextField) {
        
        let movieName : String = textField.text!
        
        if movieName.isEmpty {
            print("Enter a valid string.")
        }
        else {
            movieSearchString = movieName
            downloadMovieData(name: movieName)
        }
    }
    

}

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        downloadMovieFromTextField(textField)
        
        return true
    }
    
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return kCellIdentifiers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : MovieTableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifiers[indexPath.section]) as! MovieTableViewCell
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 66
        
        
        return cell
    }
    
    
}

