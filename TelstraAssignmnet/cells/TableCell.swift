//
//  TableCell.swift
//  TelstraAssignmnet
//
//  Created by Narre Mahesh Kumar on 29/06/20.
//  Copyright © 2020 self. All rights reserved.
//

import UIKit
import AlamofireImage

class TableCell: UITableViewCell {

   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var lbltitle: UILabel = {
              var label = UILabel()
              label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
          
              return label
          }()
    var lblDescription: UILabel = {
           var label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont(name:"HelveticaNeue-light", size: 13.0)
        label.numberOfLines = 0;
        label.lineBreakMode = .byWordWrapping
           return label
       }()
       
       var productImage:UIImageView = {
           var image = UIImageView()
           image.translatesAutoresizingMaskIntoConstraints = false
           return image
       }()
    
    func setData(data:ModelRows){
        if let title = data.title {
            self.lbltitle.text = title
        }
        else{
            self.lbltitle.text = ""
        }
        if let description = data.description{
            self.lblDescription.text = description
        }
        else{
            self.lblDescription.text = ""
        }
        if let imgURL = data.imageHref, let url = URL(string: imgURL) {
            //display image 
            productImage.af.setImage(withURL: url,placeholderImage: UIImage(named: "placeholder.png"))
        }
        else{
            productImage.image = nil
        }
    }
       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(lbltitle)
        self.addSubview(lblDescription)
        self.addSubview(productImage)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v0(110)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":productImage]))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(110)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":productImage]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-125-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":lbltitle]))
               addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":lbltitle]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-125-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":lblDescription]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0(>=90)]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":lblDescription]))
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
