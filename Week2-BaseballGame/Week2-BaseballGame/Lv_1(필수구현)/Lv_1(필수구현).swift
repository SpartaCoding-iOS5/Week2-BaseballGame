// Lv 1 (11/04 까지)
// 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
// 정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

import Foundation

func levelOne() {
    do {
        print("Level1 게임에 오신 것을 환영합니다.")
        print("1에서 9까지의 서로 다른 임의의 3자리 수를 입력해 주세요.")
        try BaseballGameLevel1.startGame(questioner: Computer(), answerer: User())
    } catch let error {
        print(error.localizedDescription)
    }
}
