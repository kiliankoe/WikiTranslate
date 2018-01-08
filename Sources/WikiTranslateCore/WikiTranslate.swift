import WikipediaKit

public enum WikiTranslate {
    public static func query(lang: String, query: String, completion: @escaping (WikipediaSearchResults?) -> Void) {
        WikipediaNetworking.appAuthorEmailForAPI = "me@kilian.io"

        let language = WikipediaLanguage(lang)

        _ = Wikipedia.shared.requestOptimizedSearchResults(language: language, term: query) { results, error in
            guard
                error == nil,
                let results = results
            else {
                completion(nil)
                return
            }

            completion(results)
        }
    }

    public static func translate(lang: WikipediaLanguage, title: String, completion: @escaping ([WikipediaArticleLanguageLink]?) -> Void) {
        WikipediaNetworking.appAuthorEmailForAPI = "me@kilian.io"

        _ = Wikipedia.shared.requestArticle(language: lang, title: title, imageWidth: 0) { article, error in
            guard
                error == nil,
                let article = article
            else {
                completion(nil)
                return
            }

            _ = Wikipedia.shared.requestAvailableLanguages(for: article) { article, error in
                guard error == nil else {
                    completion(nil)
                    return
                }

                completion(article.languageLinks)
            }
        }
    }
}
