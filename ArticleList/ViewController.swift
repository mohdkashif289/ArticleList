//
//  ViewController.swift
//  ArticleList
//
//  Created by Kashif Rizvi on 10/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    var datasource: [Article]?
    
    var tableview = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview()
         
        tableview.register(ArticleCell.self, forCellReuseIdentifier: "cell")
        tableview.dataSource = self
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 100
        
        NetworkService().getArticles {[weak self] articles in
            self?.datasource = articles
            self?.tableview.reloadData()
        }
    }
    
    func setupTableview() {
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleCell
        cell.delegate = self
        cell.setup(article: datasource?[indexPath.row])
        return cell
    }
    
    
}

extension ViewController: ArticleDelegate {
    
    func getImage(urlString: String, for imageView: UIImageView) {
        NetworkService().fetchImage(urlString: urlString, imageview: imageView)
    }
}

