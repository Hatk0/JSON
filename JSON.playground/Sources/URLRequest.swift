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
            let jsonDecoder = JSONDecoder()
            let magicCard = try jsonDecoder.decode(Card.self, from: data)

            if let optCard = magicCard.cards.first(where: { $0.name.lowercased() == "opt" }) {
                print("""
                Имя карты: \(optCard.name)
                Мановая стоимость: \(optCard.manaCost ?? "N/A")
                Конвертированная мановая стоимость: \(optCard.cmc)
                Тип карты: \(optCard.type)
                Редкость: \(optCard.rarity)
                Название набора: \(optCard.setName)
                Набор карт: \(optCard.cardSet)
                Текст: \(optCard.text)
                Художник: \(optCard.artist)
                """)
            } else if let blackLotusCard = magicCard.cards.first(where: { $0.name.lowercased() == "black lotus" }) {
                print("""
                Имя карты: \(blackLotusCard.name)
                Мановая стоимость: \(blackLotusCard.manaCost ?? "N/A")
                Конвертированная мановая стоимость: \(blackLotusCard.cmc)
                Тип карты: \(blackLotusCard.type)
                Редкость: \(blackLotusCard.rarity)
                Название набора: \(blackLotusCard.setName)
                Набор карт: \(blackLotusCard.cardSet)
                Текст: \(blackLotusCard.text)
                Художник: \(blackLotusCard.artist)
                """)
            } else {
                print("Карта не найдена")
            }
        } catch {
            print("Ошибка при декодировании данных: \(error)")
        }
    }.resume()
}
