//
//  ViewController.swift
//  YoutubeClone
//
//  Created by AALA mac on 04/10/2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,ModelDelegate {
    
    

    var model = Model()
    var videos = [Video]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        // Do any additional setup after loading the view.
        model.getVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard tableView.indexPathForSelectedRow != nil else{
            return
        }
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        let detailVC = segue.destination as! DetailsViewController
        
        detailVC.video = selectedVideo
    }
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        return cell
    }


}

