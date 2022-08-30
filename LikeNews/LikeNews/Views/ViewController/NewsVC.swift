//
//  NewsVC.swift
//  LikeNews
//
//  Created by Mishana on 30.08.2022.
//

import UIKit
import CoreData

class NewsVC: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var tableView = UITableView()
    var news: [News] = []
    var filterData: [News] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        news = fetchData()
        filterData = news
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.pin(to: view)
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
    }

    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func saveLikeNews(like: News) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "NewsItem", in: context) else { return }
        let newsObj = NewsItem(entity: entity, insertInto: context)
        newsObj.image = like.image
        newsObj.title = like.title
        newsObj.descriptions = like.description
        newsObj.date = like.date
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
   

}


extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RowVC()
        let newRow = filterData[indexPath.row]
        vc.title = newRow.title
        vc.img = newRow.image
        vc.descrip = newRow.description
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.prefersLargeTitles = true
        
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(nav, animated: true, completion: nil) //(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let likeAction = UIContextualAction(style: .normal, title: nil) { (action, souurceView, completionHandler) in
            if self.news[indexPath.row].like == false  {
                let like = self.news[indexPath.row]
                self.saveLikeNews(like: like)
                self.news[indexPath.row].like = true
            }
            completionHandler(true)
        }
        likeAction.backgroundColor = .systemGreen
        likeAction.image = (self.news[indexPath.row].like) ? UIImage(systemName: "suit.heart.fill") : UIImage(systemName: "heart")
        
        let swipeConf = UISwipeActionsConfiguration(actions: [likeAction])
        
        return swipeConf
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId) as! NewsCell
        
        let setNew = filterData[indexPath.row]
        cell.setData(new: setNew)
    
        return cell
    }
    
    
}

extension NewsVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData = []
        
        if searchText == ""{
            filterData = news
            
        }else{
            for title in news {
                if title.title.lowercased().contains(searchText.lowercased()){
                    filterData.append(title)
                }
            }
            
        }
        self.tableView.reloadData()
        
    }
}

extension NewsVC {
    func fetchData() -> [News] {
        let image1 = News(image: "vk", title: "VK", description: "Infgeignrpo i oirhfoiu wefwlibfowi eufj  f", date: "12.08.22", like: false)
        let image2 = News(image: "apteki", title: "Apteki", description: "Infgeignrpo i oirhfoiu wefwlibfowi eufj  f", date: "12.08", like: false)
        let image3 = News(image: "calendar", title: "Calendar", description: "Infgeignrpo i oirhfoiu wefwlibfowi eufj  f", date: "12.08", like: false)
        let image4 = News(image: "citydrive", title: "Citydrive", description: "Infgeignrpo i oirhfoiu wefwlibfowi eufj  f", date: "12.08", like: false)
        let image5 = News(image: "cloud", title: "Cloud", description: "Infgeignrpo i oirhfoiu wefwlibfowi eufj  f", date: "12.08", like: false)
        let image6 = News(image: "mygames", title: "Mygames", description: "Infgeignrpo i oirhfoiu wefwlibfowi eufj  f", date: "12.08", like: false)
        let image7 = News(image: "samokat", title: "Samokat", description: "Infgeignrpo i oirhfoiu wefwlibfowi eufj  f", date: "13.08", like: false)
        let image8 = News(image: "sferum", title: "Sferum", description: "Infgeignrpo i oirhfoiu wefwlibfowi eufj  f", date: "12.08", like: false)
        let image9 = News(image: "youla", title: "Youla", description: "Infgeignrpo i oirhfoiu wefwlibfowi eufj  f", date: "12.08", like: false)

        return [image1, image2, image3, image4, image5, image6, image7, image8, image9, image1,]
    }
}
