import Foundation
import CLISpinner
import Signals
import WikiTranslateCore

let args = ProcessInfo.processInfo.arguments
guard args.count == 3 else {
    print("Expected two arguments.")
    exit(1)
}

let lang = args[1]
let query = args[2]

let spinner = Spinner(pattern: .dots)
spinner.start()

Signals.trap(signal: .int) { _ in
    spinner.unhideCursor()
    exit(0)
}

WikiTranslate.query(lang: lang, query: query) { result in
    spinner.stopAndClear()

    guard let result = result else {
        print("No results.")
        exit(0)
    }

    print("Found the following \(result.results.count) results for '\(query)'")
    for (idx, result) in result.results.enumerated() {
        if result.description.isEmpty {
            print("\(idx)) \(result.title)")
        } else {
            print("\(idx)) \(result.title) - \(result.description)")
        }
    }

    print("\nPlease enter the number of the result you want to translate.")

    let article = result.results[Int(readLine()!)!]
    spinner.start()

    WikiTranslate.translate(lang: article.language, title: article.title) { languages in
        spinner.stopAndClear()

        guard let languages = languages else {
            print("No linked languages found.")
            exit(0)
        }

        for lang in languages {
            print("\(lang.language.autonym): \(lang.title)")
        }
        exit(0)
    }
}

RunLoop.main.run(until: .distantFuture)
