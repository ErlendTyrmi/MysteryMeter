//
//  SpinnerView.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 08/04/2023.
//

struct SpinnerView: View {
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<8) { index in
                Circle()
                    .foregroundColor(color)
                    .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
                    .scaleEffect(scale(for: index, in: 0..<8))
                    .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                    .rotationEffect(rotation(for: index, in: 0..<8))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .frame(width: 50, height: 50)
        .rotationEffect(.degrees(0), anchor: .center)
        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
    }
    
    private func rotation(for index: Int, in range: Range<Int>) -> Angle {
        let angle = Double(index) / Double(range.upperBound) * 360
        return .degrees(angle)
    }
    
    private func scale(for index: Int, in range: Range<Int>) -> CGFloat {
        let baseScale: CGFloat = 0.2
        let scale = 1 - CGFloat(index) / CGFloat(range.upperBound) * baseScale
        return scale < 0 ? 0 : scale
    }
}
