import Foundation

// MARK: - Call

getDataFromUrlComponents(scheme: "https", host: "api.magicthegathering.io", path: "/v1/cards", queryItem: [URLQueryItem(name: "name", value: "Opt")])

getDataFromUrlComponents(scheme: "https", host: "api.magicthegathering.io", path: "/v1/cards", queryItem: [URLQueryItem(name: "name", value: "Black Lotus")])

// Проверка на работу некорректности ссылки
getData(urlRequest: "")
