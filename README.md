## Enumerables Implementation Project

This project aims to build a better understanding how enumerables work in ruby by
writing my own versions of the same. It is based on a proposed task in The Odin Project
[here] and includes my contribution.
**The Tasks included:**

- Create #my_each, a method that is identical to #each but (obviously) does not use #each. You'll need to remember the yield statement. Make sure it returns the same thing as #each as well.

- Create #my_each_with_index in the same way.

- Create #my_select in the same way, though you may use #my_each in your definition (but not #each).

- Create #my_all? (continue as above)
- Create #my_any?
- Create #my_none?
- Create #my_count
- Create #my_map
- Create #my_inject

- Test #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40

- Modify #my_map method to take a proc instead.

- Modify  #my_map method to take either a proc or a block. It won't be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn't have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.


## Built With

- ruby 2.7.x
- rubocop
- github/workflow
  ​

## Live Demo

​
[Live Demo Link](https://repl.it/@kiptubei/Enumerables#.rubocop.yml)
​
​

## Getting Started

​
**Clone the repo on your system, open the folder in terminal of your choice**
**Run application with the command** ruby mark_enumerables.rb
**Remember to uncomment the test cases if you wish to use them as a guide**
​
​
## Authors

​#### 👤 **Mark James Kiptubei**

- Github: [@kiptubei](https://github.com/kiptubei)
- Linkedin: [mark](https://www.linkedin.com/in/mark-james-k-aa875829/)

## �� Contributing

​
Contributions, issues and feature requests are welcome!
​
Feel free to check the [issues page](https://github.com/kiptubei/Enumerables/issues).
​

## Show your support

​
Give a ⭐️ if you like this project!
​

## Acknowledgments

- The Odin project
- Rida Elbahtouri : - [Github](https://github.com/rida-elbahtouri)


## �� License

​
This project is [MIT](lic.url) licensed.
