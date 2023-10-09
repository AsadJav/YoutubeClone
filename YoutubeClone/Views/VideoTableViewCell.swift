//
//  VideoTableViewCell.swift
//  YoutubeClone
//
//  Created by AALA mac on 04/10/2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(_ v:Video){
        self.video = v
        
        guard self.video != nil else{
            return
        }
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        guard self.video!.thumbnail != "" else{
            return
        }
        print(self.video!.thumbnail)
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!){(data,response,error) in
            if error == nil && data != nil {
                if url!.absoluteString != self.video!.thumbnail {
                    print("BAS")
                    return
                }
                let image = UIImage(data: data!)
                print(image!)
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        dataTask.resume()
    }

}
