//
//  TitleCollectionViewCell.swift
//  netflix_clone
//
//  Created by Thien on 26/04/2023.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String){
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                DispatchQueue.main.async {
                    self.posterImageView.image = UIImage(data: data!)
                }
            }
            task.resume()
        }
    }
}






//let urlString = "https://cdn.baoquocte.vn/stores/news_dataimages/nguyennga/012022/19/13/nga-chu-meo-khong-lo-khi-moi-hon-2-tuoi-da-nang-125-kg.jpg?rt=20220119133733"
//        //2 URL
//        let url = URL(string: urlString)
//        //3 get data from url
//        let imgData = try! Data(contentsOf: url!)
//        //4 gan data vao trong imageview
//        myImage.image = UIImage(data: imgData)
//        print("okButton nhan dayyyy")
