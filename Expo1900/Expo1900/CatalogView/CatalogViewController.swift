//
//  CatalogViewController.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  static let cellIdentifier = "catalogCell"
  static let segueIdentifier = "detailView"
  
  let viewModel = CatalogViewModel()
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "detailView" {
      let detailvc = segue.destination as? DetailViewController
      
      if let index = sender as? Int {
               let exhibitionWorkCatalog = viewModel.exhibitionWork(at: index)
        detailvc?.viewModel.update(model: exhibitionWorkCatalog)
      }
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numOfExhibitionWorkCatalog
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let catalogCell = tableView.dequeueReusableCell(
            withIdentifier: CatalogViewController.cellIdentifier, for: indexPath) as?
            CatalogCell else {
      return UITableViewCell()
    }
    
    let exhibitionWorkInfo = viewModel.exhibitionWork(at: indexPath.row)
    catalogCell.update(info: exhibitionWorkInfo)
    
    return catalogCell
  }
  
  func tableView(_ tableView: UITableView,
                  didSelectRowAt indexPath: IndexPath) {
     performSegue(withIdentifier: CatalogViewController.segueIdentifier, sender: indexPath.row)
   }
}
