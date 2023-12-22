//
//  URL.swift
//  SDD-Case-4
//
//  Created by Haikal Lazuardi on 22/12/23.
//

import Foundation

extension URL {    
    subscript(queryParam:String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParam })?.value
    }
}
