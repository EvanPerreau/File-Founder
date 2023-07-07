require "dotenv/load"
require "find"

title = "#{ENV["APP_NAME"]} #{ENV["VERSION"]}"

puts "###{title.gsub(/./, "#")}##
#\e[36m #{title}\e[0m #
###{title.gsub(/./, "#")}##"

puts "\nWhat's the name of the file you want to find ?"
@file_name = gets.chomp

puts "\nWhat's the name of the directory where you want ot find the file
(#{ENV['APP_NAME']} is able to look at all the subfolders) ?"
@directory_path = gets.chomp


Find.find(@directory_path) do |file|
    if File.file?(file) && File.basename(file) == @file_name
      puts File.absolute_path(file)
    end
end

puts "Scan Finished !"
