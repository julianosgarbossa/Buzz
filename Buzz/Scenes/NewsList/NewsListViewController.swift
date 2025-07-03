//
//  NewsListViewController.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

class NewsListViewController: UIViewController {
    
//    private let interactor = NewsListInterector()
    
    private lazy var newsListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primary
        self.setVisualElements()
//        self.interactor.loadNews(request: NewsListModel.FetchNews.Request())
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "Notícia"
        cell.contentConfiguration = content
        return cell
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Não está fazendo nada por agora
    }
}

