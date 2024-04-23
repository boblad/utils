#!/usr/bin/env ruby

branches = %x{git branch}.split("\n").map(&:strip).reject { |s| s.include?("main") || s.include?("staging") }

branches.each do |branch|
  print "Would you like to delete the local copy of '#{branch}'? y/n: "
  input = gets.chomp

  if input == "y"
    result = %x{git branch -D #{branch}}
    puts "#{result}\n\n"
  else
    puts "Keeping it\n\n"
  end
end
