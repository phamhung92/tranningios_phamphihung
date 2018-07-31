//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// a
//print("hello word")

//b

for i in 0..<5 {
    print("")
    for j in 0..<5{
        if i==j {
            print("*")
        } else {
            print(" ")
        }
    }
}



 //c

    var  intArr = [1,3,2,4]
    print(intArr)
    intArr.append(6)
    print(intArr)

 //d
var ditionnary : [String : Any] = ["name" : "hung","dia chi" : "bac ninh","sdt":"0163351242","tuoi":25]
print(ditionnary["name"]!)

//e
var ditionnary1 : [String : Any] = ["name" : "luan","dia chi" : "bac ninh","sdt":"0163351242","tuoi":26]
var ditionnary2 : [String : Any] = ["name" : "hai","dia chi" : "bac ninh","sdt":"0163351242","tuoi":24]

var ditionanryArray = [ditionnary,ditionnary1,ditionnary2]

/*for i in 0..<ditionanryArray.count-1 {
    for j in 1..<ditionanryArray.count{
        if ditionanryArray[i]["tuoi"]<ditionanryArray[j]["tuoi"] {
            <#code#>
        }
    }
}*/
