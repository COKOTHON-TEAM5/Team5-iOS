//
//  EmotionModel.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

enum Emotion: String {
    case jealous
    case happy
    case angry
    case mystery
    case sad
    case glommy
    case weird
    case comfort
    case sweet
    case scary
    
    var emotionImg: UIImage {
        switch self {
        case .jealous:
            return .imgJealous
        case .happy:
            return .imgHappy
        case .angry:
            return .imgAngry
        case .mystery:
            return .imgMystery
        case .sad:
            return .imgSad
        case .glommy:
            return .imgGlommy
        case .weird:
            return .imgWeird
        case .comfort:
            return .imgComfort
        case .sweet:
            return .imgSweet
        case .scary:
            return .imgScary
        }
    }
    
    var emotionTitle: String {
        switch self {
        case .jealous:
            return "질투나는"
        case .happy:
            return "행복한"
        case .angry:
            return "화나는"
        case .mystery:
            return "신비로운"
        case .sad:
            return "슬픈"
        case .glommy:
            return "우울한"
        case .weird:
            return "이상한"
        case .comfort:
            return "편안한"
        case .sweet:
            return "설레는"
        case .scary:
            return "무서운"
        }
    }
    
    static func name(for index: Int) -> String? {
        let emotions = Emotion.allCases
        guard index >= 0 && index < emotions.count else {
            return nil
        }
        return emotions[index].rawValue
    }
    
    static func image(for title: String) -> UIImage? {
        return Emotion.allCases.first { $0.emotionTitle == title }?.emotionImg
    }
}

extension Emotion: CaseIterable {}

extension Emotion {
    static func emotionData() -> [(UIImage, String)] {
        return [
            (Emotion.happy.emotionImg, Emotion.happy.emotionTitle),
            (Emotion.sweet.emotionImg, Emotion.sweet.emotionTitle),
            (Emotion.comfort.emotionImg, Emotion.comfort.emotionTitle),
            (Emotion.weird.emotionImg, Emotion.weird.emotionTitle),
            (Emotion.sad.emotionImg, Emotion.sad.emotionTitle),
            (Emotion.glommy.emotionImg, Emotion.glommy.emotionTitle),
            (Emotion.scary.emotionImg, Emotion.scary.emotionTitle),
            (Emotion.mystery.emotionImg, Emotion.mystery.emotionTitle),
            (Emotion.jealous.emotionImg, Emotion.jealous.emotionTitle),
            (Emotion.angry.emotionImg, Emotion.angry.emotionTitle),
        ]
    }
}
