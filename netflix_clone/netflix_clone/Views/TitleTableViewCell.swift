//
//  TitleTableViewCell.swift
//  netflix_clone
//
//  Created by Thien on 26/04/2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let indentifier = "TitleTableViewCell"
    
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .label
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let titlesPosterUIImangeView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(playTitleButton)
        contentView.addSubview(titlesPosterUIImangeView)
        contentView.addSubview(titleLabel)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let titlePosterUIImageViewConstraint = [
            titlesPosterUIImangeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImangeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlesPosterUIImangeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterUIImangeView.widthAnchor.constraint(equalToConstant: 100),
        ]
        let titleLabelConstraint = [
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImangeView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70)
        ]
        let playTitleButtonConstraint = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]

        NSLayoutConstraint.activate(titlePosterUIImageViewConstraint)
        NSLayoutConstraint.activate(titleLabelConstraint)
        NSLayoutConstraint.activate(playTitleButtonConstraint)
    }
    
    public func configure(with model: TitleViewModel){
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                DispatchQueue.main.async {
                    self.titlesPosterUIImangeView.image = UIImage(data: data!)
                }
            }
            task.resume()
        }
        titleLabel.text = model.titleName
    }
    
    
    
    
    required init?(coder:NSCoder) {
        fatalError()
    }
    
}
