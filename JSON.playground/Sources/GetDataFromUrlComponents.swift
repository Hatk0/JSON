import Foundation

func createURL(scheme: String, host: String, path: String, queryItem: [URLQueryItem]?) -> URL? {
    var urlComponents = URLComponents()
    urlComponents.scheme = scheme
    urlComponents.host = host
    urlComponents.path = path
    urlComponents.queryItems = queryItem
    
    return urlComponents.url
}

public func getDataFromUrlComponents(scheme: String, host: String, path: String, queryItem: [URLQueryItem]?) {
    if let url = createURL(scheme: scheme, host: host, path: path, queryItem: queryItem) {
        getData(urlRequest: url.absoluteString)
    } else {
        print("Невозможно создать адрес")
    }
}
