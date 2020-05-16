let priceList = [12.3, 13.4, 15.4]
var priceListString: [String] = []

priceListString = priceList.map({ (priceee) -> String in
    return "\(priceee * 2) TL"
})

priceListString = priceList.map({ "\($0 * 2) TL" })

print(priceListString.first)

let miles = ["point1": 40.8, "point2": 50.6]

let km = miles.map { (key, value) in value / 1693}
print(km.first)

