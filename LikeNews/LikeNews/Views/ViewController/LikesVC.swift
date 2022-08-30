//
//  LikesVC.swift
//  LikeNews
//
//  Created by Mishana on 30.08.2022.
//

import UIKit
import CoreData

class LikesVC: UIViewController {
    
    var tableView = UITableView()
    var refreshControll = UIRefreshControl()
    var likeNews: [News] = []
    var refreshNews: [NewsItem] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NewsItem> = NewsItem.fetchRequest()
        
        do {
            refreshNews = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
//        tableView.reloadData() Можно и так, но тогда зачем рефреш Контроллер)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        refreshControll.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControll)

        print("REFRESHHHH: ", refreshNews)
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.pin(to: view)
        tableView.register(LikeCell.self, forCellReuseIdentifier: LikeCell.reuseId)
    }

    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func refresh(send: UIRefreshControl) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControll.endRefreshing()
        }
    }
}


extension LikesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<NewsItem> = NewsItem.fetchRequest()
            
            context.delete(refreshNews[indexPath.row])
            refreshNews.remove(at: indexPath.row)
            do {
                try context.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refreshNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LikeCell.reuseId) as! LikeCell
        
        
        let like = refreshNews[indexPath.row]
        guard let image = like.image else {return UITableViewCell()}
        
        cell.myImageView.image = UIImage(named: image)!
        cell.myTitleLabel.text = like.title
        cell.myDescriptionLabel.text = like.descriptions
        cell.myDateLabel.text = like.date
        
        return cell
    }
}

