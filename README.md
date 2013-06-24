UITagField
==========

**UITagField** is an implementation of UITextField that allows for easy input/display of Tags

![UITagField Screenshot](http://i40.tinypic.com/2crqd8j.jpg "UITagField Screenshot")

USAGE
-----
Just initialize **UITagField**, set the delegate (Optional), add to your parent view, and you're good to go!
Check out the "UITagFieldExample" Xcode project which shows a basic working example.

```objc
tagField                = [[UITagField alloc] initWithFrame: CGRectMake(20, 20, 280, 0)]; // Height is always 30, you shouldn't modify it.
tagField.tagDelegate    = self;

[self.view addSubview: tagField];

// Set some tags to begin with, if you have any
tagField.tags = @[@"Tag1", @"Tag2", @"Tag3"];
```

LICENSE
-------------------

Copyright (C) 2013 Developed by Shai Mishali

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