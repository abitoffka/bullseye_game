//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Aigerim Abitayeva on 18.12.2022.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leadeboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack{
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10){
                HeaderView(leadeboardIsShowing: $leadeboardIsShowing)
                LabelView()
                ScrollView{
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View{
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
                RoundedRectangle(cornerRadius: .infinity)
                    .strokeBorder(Color("CircleStrokeColor"), lineWidth: Constants.General.strokeWidth))
            .padding(.leading)
            .padding(.trailing)
            .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        
    }
}

struct HeaderView: View {
    @Binding var leadeboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View{
        ZStack {
            HStack{
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                }
            } .padding(.top)
            HStack{
                Spacer()
                Button(action: {
                    leadeboardIsShowing = false
                }) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                        .padding()
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View{
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.trailing)
        .padding(.leading)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leadeboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderBoardView(leadeboardIsShowing: leadeboardIsShowing, game: game)
        LeaderBoardView(leadeboardIsShowing: leadeboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leadeboardIsShowing: leadeboardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderBoardView(leadeboardIsShowing: leadeboardIsShowing, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
