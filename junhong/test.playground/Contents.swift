import UIKit

var str = "Hello, playground"

let constant: Double = 10.5
var y = 10
var x = Double(y) + constant
// var과 let의 차이 : let은 한번 선언하고 값을 지정하면, 후에 변경ㅇ ㅣ불가능하다.
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
var meaning = emojiDict[wordToLookup] // 실제로 키값이 주어지지 않을 수도 있기 때문에, meaning의 값은 선택변수이다.

print(meaning!)

wordToLookup = "😠"
meaning = emojiDict[wordToLookup]

if let meaning = meaning
{
    print(meaning)
}

//특수값 "nil"은 값이 없는 선택적 변수에 지정됨
var jobTitle: String?
jobTitle = "iOS Developer"
//선택적 변수를 선언하고 값을 지정하는 것 까지는 괜찮은데, 그 값을 사용해서 연산을 하려고 했을 때 문제가 발생함
//끝에 !를 붙이는 것을 강제 언래핑이라고 함.
if jobTitle != nil
{
    message = "Your job titile is " + jobTitle!
}
if let jobTitleWithValue = jobTitle
{
    message = "Your job title is " + jobTitleWithValue
}
if let jobTitle = jobTitle
{
    message = "Your job title is " + jobTitle
}

let containerView = UIView(frame: CGRect(x: 0, y:0, width: 300, height: 300))
containerView.backgroundColor = UIColor.purple

let emojiLabel = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))
emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

containerView.addSubview(emojiLabel)

let meaningLabel = UILabel(frame: CGRect(x: 110, y: 100, width: 150, height: 150))
meaningLabel.text = meaning
meaningLabel.font = UIFont.systemFont(ofSize: 30.0)
meaningLabel.textColor = UIColor.white

containerView.addSubview(meaningLabel)
