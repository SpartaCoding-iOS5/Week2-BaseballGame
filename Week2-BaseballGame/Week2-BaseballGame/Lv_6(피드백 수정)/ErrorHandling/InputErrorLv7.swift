import Foundation

enum InputErrorLv7: Error {
    case invalidLength
    case notNumber
    case duplicateNumbers

    var errorMessage: String {
        switch self {
        case .invalidLength:
            return Constants.invalidLengthMessage
        case .notNumber:
            return Constants.notNumberMessage
        case .duplicateNumbers:
            return Constants.duplicateNumbersMessage
        }
    }
}
