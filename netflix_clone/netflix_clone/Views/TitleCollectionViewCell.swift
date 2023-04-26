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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        applyConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
        
    }
    
    private func applyConstraints() {
        let titlePosterUIImageViewConstraint = [
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            posterImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 - 20),
        ]

        NSLayoutConstraint.activate(titlePosterUIImageViewConstraint)
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



