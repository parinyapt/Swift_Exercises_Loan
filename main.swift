//Create Date 17-03-2022
//64130010049 Parinya Termkasipanich
import Foundation

let config_interest:Float = 1.25
var money:[String:Float] = ["amount":0.0,"repay_month":0.0,"interest":0.0,"temp":0.0]

var temp_status:Bool = false
var temp_input:String = ""
var temp_count:Int = 1

repeat {
  print("Enter Amount Money (Max = 200,000) : ",terminator: "")
  temp_input = readLine()!
  if Float(temp_input) != nil {
    money["amount"] = Float(temp_input)!
    temp_status = true
  }
}while(temp_status == false || money["amount"]! <= 0 || money["amount"]! > 200000)

temp_status = false
repeat {
  print("Enter Amount Repay Money per Month (>=5%) : ",terminator: "")
  temp_input = readLine()!
  if Float(temp_input) != nil {
    money["repay_month"] = Float(temp_input)!
    temp_status = true
  }
}while(temp_status == false || money["repay_month"]! < (0.05 * money["amount"]!) || money["repay_month"]! > money["amount"]!)

print("\nPayment Number | Interest | Capital Repayment | Capital Balance")

while(money["amount"]! != 0) {
  money["temp"] = (config_interest / 100) * money["amount"]!
  money["interest"]! += money["temp"]!

  if money["amount"]! >= money["repay_month"]! {
    money["amount"]! -= money["repay_month"]!
  }else{
    money["repay_month"] = money["amount"]!
    money["amount"]! -= money["amount"]!
  }
  
  print("\(String(format: "%8d", temp_count)). \(String(format: "%14.2f", money["temp"]!)) \(String(format: "%14.2f", money["repay_month"]!)) \(String(format: "%17.2f", money["amount"]!))")
  temp_count += 1
}
print("\nTotal Interest = \(String(format: "%.2f", money["interest"]!))")