//
//  main.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

var baseballGame = BaseballGame()

baseballGame.gameSelect()

/// 숫자 야구 게임의 로직
/*
 1. main에서 BaseballGame 객체가 생성된다.
 2. gameSelect() 메소드를 실행하면 선택지가 주어진다.
 
 3-1. 게임 실행하기
    1) 게임 시작하기를 선택하면 play() 메소드가 실행된다.
    2) readLine() 으로 입력을 받는다.
    3) while 반복문으로 게임이 종료(정답 맞추기)될 때까지 반복한다.
    4) 게임이 끝나면 game.playRecord.savedGameRecord() 실행된다.
    5) 저장된 게임 기록을 gameSelect() 메소드 내의 playHistory 배열에 저장된다.
    6) gameSelect()로 돌아간다.
 
 3-2. 게임 기록 확인하기
    1) 게임 기록 확인하기를 선택하면 loadGameRecord() 메소드가 실행된다.
    2) 파라미터가 빈 값이라면 오류문구를 출력하고 gameSelect()로 돌아간다.
    3) 파라미터에 값이 있다면 forEach로 콘솔창에 출력된다.
    4) 출력이 완료되면 gameSelect()로 돌아간다.
 
 3-3. 게임 종료하기
    1) 게임 종료하기를 선택하면 exitGame() 메소드가 실행된다.
    2) "게임을 종료하시겠습니까?" 라는 문구가 출력된 후 사용자의 입력이 요구된다.
    3) Y or y 입력시 true를 반환한다.
    4) N or n 입력시 false를 반환한다.
    5) 반환된 Bool 값을 gameSelect()의 isOnGame 값에 전달한다.
    6) isOnGame이 false 되면 while 반복문이 종료되며 게임이 종료된다.
 */

