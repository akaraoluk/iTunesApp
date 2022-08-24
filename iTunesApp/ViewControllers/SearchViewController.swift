//
//  SearchViewController.swift
//  iTunesApp
//
//  Created by Abdurrahman Karaoluk on 7.08.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var itemSearchBar: UISearchBar!
    @IBOutlet var itemCollectionView: UICollectionView!
    
    var filteredItem = [ResultModel]()
    var searchBarText = ""
    private let itemService = ItemServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemCollectionView.dataSource = self
        itemCollectionView.delegate = self
        itemSearchBar.delegate = self
        itemCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func logOutButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "isUserLogedIn")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        cell.updateUI(with: filteredItem[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController {
            detailVC.collectionID = filteredItem[indexPath.row].collectionID
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeW = (itemCollectionView.frame.size.width - 20) / 2
        let sizeH = (itemCollectionView.frame.size.height - 10) / 2
        return CGSize(width: sizeW, height: sizeH)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredItem = []
        if searchText == "" {
            self.itemCollectionView.reloadData()
        } else if searchText.count > 2 {
            self.itemService.getFilteredResult(query: searchText) { results in
                switch results {
                case .success(let response):
                    self.searchBarText = searchText
                    self.filteredItem = response.results!
                    self.itemCollectionView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

