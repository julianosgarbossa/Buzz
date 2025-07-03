//
//  NewsListViewController.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

protocol NewsListDisplayLogic: AnyObject {
    func displayFetchedNews(viewModel: NewsListModel.FetchNews.ViewModel)
    func displayError(message: String)
}

class NewsListViewController: UIViewController {
    
    var interactor: NewsListBusinessLogic?
    var displayedArticles: [NewsListModel.FetchNews.ViewModel.DisplayedArticle] = []
    
    private lazy var newsListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NewsListArticleCell.self, forCellReuseIdentifier: NewsListArticleCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        self.setup()
        self.fetchNews()
        self.setVisualElements()
    }
    
    private func setup() {
        let viewController = self
        let interactor = NewsListInterector()
        let presenter = NewsListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    private func fetchNews() {
        interactor?.loadNews(request: NewsListModel.FetchNews.Request())
    }
    
    private func setVisualElements() {
        view.addSubview(newsListTableView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newsListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - Table View DataSource and Delegate
extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListArticleCell.identifier, for: indexPath) as? NewsListArticleCell else { return UITableViewCell() }
        cell.configure(article: displayedArticles[indexPath.row])
        return cell
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Protocol NewsListDiplayLogic
extension NewsListViewController: NewsListDisplayLogic {
    func displayFetchedNews(viewModel: NewsListModel.FetchNews.ViewModel) {
        self.displayedArticles = viewModel.displayedArticles
        newsListTableView.reloadData()
    }
    
    func displayError(message: String) {
        let alert = UIAlertController(title: "Erro!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

