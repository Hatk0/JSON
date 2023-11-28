import Foundation

// MARK: - URLComponents

var optUrlComponents = URLComponents()
optUrlComponents.scheme = "https"
optUrlComponents.host = "api.magicthegathering.io"
optUrlComponents.path = "/v1/cards"
optUrlComponents.queryItems = [
    URLQueryItem(name: "name", value: "Opt"),
]

var blackLotusUrlComponents = URLComponents()
blackLotusUrlComponents.scheme = "https"
blackLotusUrlComponents.host = "api.magicthegathering.io"
blackLotusUrlComponents.path = "/v1/cards"
blackLotusUrlComponents.queryItems = [
    URLQueryItem(name: "name", value: "Black Lotus"),
]

// MARK: - Call

if let optURL = optUrlComponents.url, let blackLotusURL = blackLotusUrlComponents.url {
    getData(urlRequest: optURL.absoluteString)
    getData(urlRequest: blackLotusURL.absoluteString)
} else {
    print("Невозможно создать адрес")
}
