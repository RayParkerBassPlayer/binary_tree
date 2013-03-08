require_relative "lib/binary_tree"
require "ruby-prof"

def print_result(result)
  printer = RubyProf::FlatPrinter.new(result)
  printer.print(STDOUT)
  puts
end

data = []
array = []
tree = BinaryTree.new


puts "Creating data..."
100000.times do
  data << rand(1000000)
end

puts "Loading array..."
array_fill_result = RubyProf.profile do
  for int in data
    array << int
  end
end

print_result(array_fill_result)

puts "Sorting array..."
array_sort_result = RubyProf.profile do
  array.sort
end

print_result(array_sort_result)

puts "Loading tree..."
tree_fill_result = RubyProf.profile do
  for int in data
    tree.add(int)
  end
end

print_result(tree_fill_result)


puts "Find an item in array..."
array_find_result = RubyProf.profile do
  array.find(array[array.count / 2])
end

print_result(array_find_result)

puts "Find an item in tree..."
tree_find_result = RubyProf.profile do
  tree.find(array[array.count / 2])
end

print_result(tree_find_result)
