Gem::Specification.new do |s|
  s.name        = 'rencdec'
  s.version     = '0.0.1'
  s.date        = '2012-04-13'
  s.summary     = 'Ruby encoder/decoder for arrays of arbitrary elements and for those with dislexia, not to be confused with redneck.'
  s.description = 'Created to fill a need in supplying two arrays (a,b) of varying size and representing a third array (c) that uses items from the first array (a) and reversably encodes it into items from the second array (b) and returns the fourth array (d). Decoding using the same arrays should turn fourth array (d) into the third array (c). Examples include letters to numbers, musical notes to colors, or any other grouping of objects describable as an array of words.'
  s.authors     = ['klappy']
  s.email       = 'christopher@klapp.name'
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(README.rdoc)
  s.homepage    = 'http://klappy.github.com/rencdec/'
  s.add_dependency('radix')
end