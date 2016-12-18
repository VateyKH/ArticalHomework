//
//  MainTableViewCell.swift
//  HWTest3
//
//  Created by otey on 12/14/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit
import Kingfisher


class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var MainTitleLabel: UILabel!
    @IBOutlet weak var MainDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(article: ArticalModel){
        MainTitleLabel.text = article.title
        MainDateLabel.text = article.created_date
        MainImageView.kf.setImage(with: URL(string: (article.image?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))!))
        
    }

}
