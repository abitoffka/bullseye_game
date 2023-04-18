//
//  TextView.swift
//  Bullseye
//
//  Created by Aigerim Abitayeva on 26.10.2022.
//

import SwiftUI

struct InstructionText: View {
    var text : String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct TitleText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .multilineTextAlignment(.center)
            .lineSpacing(1.5)
            .font(.caption)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
            .foregroundColor(Color("TextColor"))
            .frame(width: 166.0, height: 67.0)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .multilineTextAlignment(.center)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(
                Color.accentColor)
            .cornerRadius(12.0)
            .overlay(
                RoundedRectangle(cornerRadius: 12.0)
                    .strokeBorder(Color("BackgroundColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}


struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .font(.caption)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View{
        Text(text.uppercased())
            .kerning(2.0)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
            BigNumberText(text: "999")
            SliderLabelText(text: "00")
            TitleText(text: "Score")
            BodyText(text: "You scored 200 Points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 10)
            DateText(date: Date())
            LabelText(text: "Score")
        }
        .padding()
    }
}
