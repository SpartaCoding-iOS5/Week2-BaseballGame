// Lv 3 (11/06 까지)

/*
 - 정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요
     - 맨 앞자리에 0이 오는 것은 불가능합니다
         - 092 → 불가능
         - 870 → 가능
         - 300 → 불가능
 */

import Foundation

func levelThree() {
    let playGame = BaseBallGame()
    playGame.initGame()
    playGame.startGame()
}
