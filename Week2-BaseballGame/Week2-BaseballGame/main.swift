import Foundation

let recordManager = RecordManager()
let printManager = PrintManager()
let baseballGame = BaseballGame(recordManager: recordManager, printManager: printManager)
baseballGame.startGame()

