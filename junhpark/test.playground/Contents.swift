import UIKit

var str = "Hello, playground"

let constant: Double = 10.5
var y = 10
var x = Double(y) + constant

var number: Double = 10.5
var result: Double = number + Double(constant)
if y == 10
{
    print("hello")
}
number = 50
var message = "The best way to get started is to stop talking and code"
var greeting = "Hello "
var name = "Simon"
message = greeting + name
message.uppercased()
message.lowercased()
message.count

var bookPrice = 39
var numOfCopies = 5
var totalPrice = bookPrice * numOfCopies
var totalPriceMessage = "The price of the book is $ \(totalPrice)"

var timeYouWakeUp = 6

if (timeYouWakeUp == 6)
{
    print("Cook yourself a big breakfast!")
}
else
{
    print("Go out for breakfast")
}

var bonus = 5000

if bonus >= 10000
{
    print("I will travel to Paris and London!")
}
else if (bonus >= 5000 && bonus < 10000)
{
    print("I will travel to Tokyo")
}
else if (bonus >= 1000 && bonus < 5000)
{
    print("I will travel to Bangkok")
}
else
{
    print("Just stay home")
}

//C에서 배열과 비슷함.
var bookCollection = ["Tool of Titans", "Rework", "Your Move"]
bookCollection[0]
bookCollection.append("Authority")
bookCollection.append("junhpark")
bookCollection.count

for index in 0...3
{
    print(bookCollection[index])
}
for index in 0...bookCollection.count - 1
{
    print(bookCollection[index])
}
for book in bookCollection
{
    print(book)
}

//사전 기능 : 사전 기능은 1대1 교환으로 이해하면 편할 것 같다.
var bookCollectionDict = ["123215321": "Tool of Titans", "4454448": "Rework", "15654": "Authority"]
bookCollectionDict["445448"]
for (key, value) in bookCollectionDict
{
    print("ISBN: \(key)")
    print("Title: \(value)")
}

var emojiDict: [String: String] = ["👻": "Ghost", "💩": "Poop", "😠": "Aangry", "😱": "scream", "👾": "Alien monster"]
var wordToLookup = "👻"
var meaning = emojiDict[wordToLookup]

wordToLookup = "😠"
meaning = emojiDict[wordToLookup]

//특수값 "nil"은 값이 없는 선택적 변수에 지정됨
var jobTitle: String?
jobTitle = "iOS Developer"
//선택적 변수를 선언하고 값을 지정하는 것 까지는 괜찮은데, 그 값을 사용해서 연산을 하려고 했을 때 문제가 발생함
if jobTitle != nil
{
    message = "Your job titile is " + jobTitle!
}

