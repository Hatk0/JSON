import Foundation

public func getData(urlRequest: String) {
    let urlRequest = URL(string: urlRequest)
    guard let url = urlRequest else {
        print("Ссылка сформирована некорректно")
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("Ошибка: \(error!)")
        }
        
        if let response = response as? HTTPURLResponse {
            print("Код ответа от сервера: \(response.statusCode)")
        } else {
            print("Невозможно получить ответ от сервера")
        }
        
        guard let data = data else { return }
        
        do {
            let magicCard = try decodeCard(from: data)

            let matchingCards = magicCard.cards.filter { $0.name.lowercased() == "opt" || $0.name.lowercased() == "black lotus" }
            if matchingCards.isEmpty {
                print("Карты не найдены")
            } else {
                for card in matchingCards {
                    printCardDetails(card: card)
                }
            }
        } catch {
            print("Ошибка при декодировании данных: \(error)")
        }
    }.resume()
}

func decodeCard(from data: Data) throws -> Card {
    let jsonDecoder = JSONDecoder()
    let magicCard = try jsonDecoder.decode(Card.self, from: data)
    return magicCard
}

func printCardDetails(card: CardElement) {
    print("""
        Имя карты: \(card.name)
        Мановая стоимость: \(card.manaCost ?? "N/A")
        Конвертированная мановая стоимость: \(card.cmc)
        Тип карты: \(card.type)
        Редкость: \(card.rarity)
        Название набора: \(card.setName)
        Набор карт: \(card.cardSet)
        Текст: \(card.text)
        Художник: \(card.artist)
        """)
}
