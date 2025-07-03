//
//  NewsListArticleCell.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 03/07/25.
//

import UIKit
import Kingfisher

class NewsListArticleCell: UITableViewCell {

    static let identifier: String = String(describing: NewsListArticleCell.self)
    
    private let articleAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "backgroundColor")
        return label
    }()
    
    private let articleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let articleDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        contentView.addSubview(articleAuthorLabel)
        contentView.addSubview(articleTitleLabel)
        contentView.addSubview(articleDescriptionLabel)
        contentView.addSubview(articleImageView)
        contentView.addSubview(articleDateLabel)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            articleAuthorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            articleAuthorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleAuthorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            articleTitleLabel.topAnchor.constraint(equalTo: articleAuthorLabel.bottomAnchor, constant: padding),
            articleTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            articleDescriptionLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: padding),
            articleDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            articleImageView.topAnchor.constraint(equalTo: articleDescriptionLabel.bottomAnchor, constant: padding),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            articleImageView.heightAnchor.constraint(equalToConstant: 200),
            
            articleDateLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: padding),
            articleDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            articleDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            articleDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
    }
    
    func configure(article: NewsListModel.FetchNews.ViewModel.DisplayedArticle) {
        articleAuthorLabel.text = article.author
        articleTitleLabel.text = article.title
        articleDescriptionLabel.text = article.description
        articleImageView.kf.setImage(with: article.imageUrl)
        articleDateLabel.text = article.publishedAt
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleAuthorLabel.text = nil
        articleTitleLabel.text = nil
        articleDescriptionLabel.text = nil
        articleImageView.image = nil
        articleDateLabel.text = nil
    }
}
