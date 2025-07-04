//
//  NewsListDetailViewController.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 04/07/25.
//

import UIKit

protocol NewsListDetailDisplayLogic: AnyObject {
    func displayFetchedNews(viewModel: NewsListDetailModel.FetchNewsDetail.ViewModel)
    func displayError(message: String)
}

class NewsListDetailViewController: UIViewController {
    
    var articleId: Int
    var interactor: NewsListDetailBusinessLogic?
    
    private lazy var articleTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    init(articleId: Int) {
        self.articleId = articleId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        self.setup()
        self.setVisualElements()
        self.fetchNewsById()
       
    }
    
    private func setVisualElements() {
        view.addSubview(articleTitleLabel)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            articleTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            articleTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            articleTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
    private func fetchNewsById() {
        interactor?.loadNewsFromId(request: NewsListDetailModel.FetchNewsDetail.Request(id: articleId))
    }
    
    private func setup() {
        let viewConroller = self
        let interactor = NewsListDetailInteractor()
        let presenter = NewsListDetailPresenter()
        viewConroller.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewConroller
    }
}

extension NewsListDetailViewController: NewsListDetailDisplayLogic {
    func displayFetchedNews(viewModel: NewsListDetailModel.FetchNewsDetail.ViewModel) {
        articleTitleLabel.text = viewModel.displayedArticle?.title
    }
    
    func displayError(message: String) {
        let alert = UIAlertController(title: "Erro!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
