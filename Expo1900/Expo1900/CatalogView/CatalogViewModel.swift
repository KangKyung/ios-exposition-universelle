//
//  CatalogViewModel.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import Foundation

class CatalogViewModel {
  var exhibitionWorkCatalog: [ExhibitionWorkInfo] = []
  
  init() {
    let jsonFile = JsonFile(fileName: "items")
    do {
      let exhibition = try jsonFile.decode(type: Catalog())
      for work in exhibition.catalog {
        let exhibitionWorkInfo = ExhibitionWorkInfo(name: work.name,
                                                    imageName: work.imageName,
                                                    shortDescription: work.shortDescription,
                                                    description: work.description)
        exhibitionWorkCatalog.append(exhibitionWorkInfo)
      }
    } catch {
      print(error)
    }
  }
  
  var numOfExhibitionWorkCatalog: Int {
    return exhibitionWorkCatalog.count
  }
  
  func exhibitionWorkInfo(at index: Int) -> ExhibitionWorkInfo {
    return exhibitionWorkCatalog[index]
  }
}
