import Foundation

public extension Int {
    
    var roman: String? {
        if (self < 1 || self > 3999) {
            return nil
        }
        
        var resutlString = ""
        var number = self
        while number > 0 {
            switch number {
            case 1000...3999:
                resutlString.append("M")
                number -= 1000
            case 900...999:
                resutlString.append("CM")
                number -= 900
            case 500...899:
                resutlString.append("D")
                number -= 500
            case 400...499:
                resutlString.append("CD")
                number -= 400
            case 400...499:
                resutlString.append("CD")
                number -= 400
            case 100...399:
                resutlString.append("C")
                number -= 100
            case 90...99:
                resutlString.append("XC")
                number -= 90
            case 50...89:
                resutlString.append("L")
                number -= 50
            case 40...49:
                resutlString.append("XL")
                number -= 40
            case 10...39:
                resutlString.append("X")
                number -= 10
            case 9:
                resutlString.append("IX")
                number -= 9
            case 5...8:
                resutlString.append("V")
                number -= 5
            case 4:
                resutlString.append("IV")
                number -= 4
            case 1...3:
                resutlString.append("I")
                number -= 1
            default:
                return nil
            }}
        return resutlString
    }
}
