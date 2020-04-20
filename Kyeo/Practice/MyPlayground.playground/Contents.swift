import UIKit

let constant = 10
var y = 10
var x = y + 10
print(x)

var pi: Double = 3.14
print(pi)

var message = "Hello, Swift!"
print(message)

var two = "two"
var some = "some"

print(two + some)
message = two + some;
message = message.uppercased()
print(message)
message = "Price is $"
var price = 42
message = "Price is.. $\(price)"
print(message)

price += 1
print("Price: \(price)");
if (price == 42)
{
    print("42424242")
}
else
{
    print("24242424")
}

var member = ["kyeo", "junhpark"]

print(member[0])
print(member[1])
member.append("twosome")
print(member[2])
member.append("42")
print(member[3])
member.count
print(member.count)
for index in 0...3
{
    print("MEMBER \(index + 1): \(member[index])")
}

for index in 0...member.count - 1
{
    print("TEST: \(member[index])")
}

var guild = ["gun", "gon", "gam", "lee"]

for index in guild
{
    print(index)
}

var dic = ["42": "FourtyTwo", "24": "TwentyFour", "33": "ThirtyThree"]

for (key, value) in dic
{
    print("KEY: \(key)")
    print("Value: \(value)")
}

var emojiDict: [String: String] = ["👻": "GHOST",
                                  "💩": "POOP",
                                  "😡": "ANGRY",
                                  "😱": "SCREAM",
                                  "👾": "ALIEN:"]
for dictIndex in emojiDict
{
    print(dictIndex)
}

var wordToLookup = "👻"
var meaning:String? = emojiDict[wordToLookup]
if meaning != nil
{
    print(meaning!)
}

var arr = [42, 24, 68]

for (index) in (0...2)
{
    print(arr[index])
}

emojiDict["🤓"] = "NERDY"

print(emojiDict)
for index in emojiDict
{
    print(index)
}

var emoji = "🤓"

var data = emojiDict[emoji]

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
containerView.backgroundColor = UIColor.orange

let emojiLabel = UILabel(frame: CGRect(x:95, y:70, width:150, height:150))

emojiLabel.text = emoji
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

containerView.addSubview(emojiLabel)

let meaningLabel = UILabel(frame: CGRect(x: 100, y: 10, width: 150, height: 150))
meaningLabel.text = emojiDict[emoji]
meaningLabel.font = UIFont.systemFont(ofSize: 30.0)

containerView.addSubview(meaningLabel)
