//
//  XcodeJSONValidator.swift
//  UITests
//
//  Created by Ivo Teixeira on 31/01/2022.
//  Copyright © 2022 Ivo Teixeira. All rights reserved.
//

import Foundation

@main
enum MyScript {

  static func main() throws {
    
      let url = Bundle.main.bundleURL

      if let enumerator = FileManager.default.enumerator(at: url,
                                                         includingPropertiesForKeys: [.isRegularFileKey],
                                                         options: [.skipsHiddenFiles, .skipsPackageDescendants]) {

          for case let fileURL as URL in enumerator {

              if (fileURL.path.contains(".json")) {

                  do {
                      
                      if let jsonData = (try String(contentsOfFile: fileURL.path).data(using: .utf8)) {
                          
                          _ = try JSONSerialization.jsonObject(with: jsonData, options: .fragmentsAllowed)
                      }
                
                  } catch {

                      print("\(fileURL.path): error: Please Validate JSON file")
                  }
              }
          }
      }
    }
}

