import Foundation

// MARK: - Card

struct Card: Codable {
    let cards: [CardElement]
}

// MARK: - CardElement

struct CardElement: Codable {
    let name: String
    let manaCost: String?
    let cmc: Int
    let type: String
    let rarity: String
    let setName: String
    let cardSet: String
    let text: String
    let artist: String

    enum CodingKeys: String, CodingKey {
        case name, manaCost, cmc, type, rarity, setName, text, artist
        case cardSet = "set"
    }
}
