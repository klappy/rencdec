# R(uby)Enc(ode)Dec(oder)

[Rencdec homepage](http://klappy.github.com/rencdec/)

## Purpose

Created to fill a need in supplying two arrays (a,b) of varying size and representing a third array (c) that uses items from the first array (a) and reversably encodes it into items from the second array (b) and returns the fourth array (d). Decoding using the same arrays should turn fourth array (d) into the third array (c). Examples include letters to numbers, musical notes to colors, or any other grouping of objects describable as an array of words.

---
## Installation
[Install rencdec via rubygems and/or bundler](https://rubygems.org/gems/rencdec)
### Rubygems

```
gem install rencdec
```
### Bundler

```
gem "rencdec", "~> 0.0.1"
```
## Examples
### Example A
Simple letters to numbers.

```ruby
data =  'hello'.chars.map(&:to_sym)   #=> [:h, :e, :l, :l, :o]
current = 'abcdefghijklmnopqrstuvwxyz'.chars.map(&:to_sym)   #=> [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z]
target = (0..9).to_a   #=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
rencdec = Rencdec.new(current_data: data, current_encoding: current, target_encoding: target)
rencdec.encode  #=> [3, 2, 7, 6, 8, 7, 2]
rencdec.decode  #=> [:h, :e, :l, :l, :o]
rencdec.verify  #=> true
```
### Example B
Arbitrary letters to other letters.

```ruby
rencdec = Rencdec.new(current_data: [:q,:w,:e,:r,:t,:y], current_encoding: [:e,:q,:r,:t,:w,:y], target_encoding: [:a,:b,:c,:d])
rencdec.encode  #=> [:d, :a, :c, :d, :d, :d, :d]
rencdec.decode  #=> [:q, :w, :e, :r, :t, :y]
rencdec.verify  #=> true
```
### Example C
Musical notes to colors.

```ruby
data = [:c,:d,:e,:f,:g,:a,:b,:c]
current = [:c,:cs,:d,:ds,:e,:f,:fs,:g,:gs,:a,:as,:b]
target = %w{red violet blue green yellow orange}.map(&:to_sym)  #=> [:red, :violet, :blue, :green, :yellow, :orange]
rencdec = Rencdec.new(current_data: data, current_encoding: current, target_encoding: target)
rencdec.encode  #=> [:yellow, :violet, :violet, :orange, :red, :blue, :green, :yellow, :red]
rencdec.decode  #=> [:c, :d, :e, :f, :g, :a, :b, :c]
rencdec.verify  #=> true
```