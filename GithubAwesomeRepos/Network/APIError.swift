//
//  APIError.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation

enum APIError: Error {
  case parsing(description: String?)
  case api(description: String?)
  case noConnetion
}
