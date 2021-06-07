import Foundation

final class CallStation { }

var  usersBook = [User]()
var  callList = [Call]()
var  currentCallList:[UUID: Call] = [:]

extension CallStation: Station {
    func users() -> [User] {
        usersBook
    }
    
    func add(user: User) {
        switch usersBook.contains(user) {
        case false:
            usersBook.append(user)
        default:
            break
        }
    }
    
    func remove(user: User) {
        for i in 0...usersBook.count - 1 {
            if user == usersBook[i] {
                usersBook.remove(at:i)
            }
        }
    }
    
    func execute(action: CallAction) -> CallID? {
        
        switch action {
        case .start(from: let userOne, to: let userTwo):
            if usersBook.contains(userOne) && usersBook.contains(userTwo) {
                let call = Call(id:UUID(), incomingUser:userOne, outgoingUser:userTwo, status:.calling)
                callList.append(call)
                return call.id
            }
                if !usersBook.contains(userOne) || !usersBook.contains(userTwo) {
                    let callOne = Call(id:UUID(), incomingUser: userOne, outgoingUser: userTwo, status:.ended(reason:.error))
                    callList.append(callOne)
                    return callOne.id
                }
            if self.currentCall(user:userTwo) != nil {
                let callTwo = Call(id:UUID(), incomingUser:userOne, outgoingUser:userTwo, status:.ended(reason:.userBusy))
                callList.append(callTwo)
            }
        case .answer(from: let userOne):
            let status = currentCall(user:userOne)
        default:
            break
        }
        return nil
    }
    
    func calls() -> [Call] {
        callList
    }
    
    func calls(user: User) -> [Call] {
        []
    }
    
    func call(id: CallID) -> Call? {
        nil
    }
    
    func currentCall(user: User) -> Call? {
        currentCallList[user.id]
    }
}
