# DPPPickerView

A **naked** and yet **simple** subclass of UIPickerView written in Swift for learning purpose.

## How to use
DPPPickerView provides a simple block 
`
var selected : ((title : String) -> Void)?
`
to expose the selected element of pickerView.
You shoudl invoke the picker as follow:

```
picker.selected = { (title: String)->Void in
		print("Chosen item \(title)")
```

## Notes
I used this class on a lerning project where I put the picker as inputView of a UITextField inside a custom UITableViewCell. For updating the textField text I create `dynamic var titleSelected` to do KVO, otherwise that var were not used because the value of selected object can be retrieved with block described in the 'How to use' section. 


License
=======

The MIT License (MIT)

Copyright (c) 2016 Dario Pizzuto

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
