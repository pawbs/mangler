#!/usr/bin/env ruby

require "rc4"

#puts ARGV.length

if ARGV.length != 2 
	puts "invalid number of arguments; exiting"
	exit
end

#puts ARGV[0]
#puts ARGV[1]

if File.exist?(ARGV[0]) == false
	puts "file \"" + ARGV[0] + "\" does not exist; exiting"
	exit
else
	puts "processing \"" + ARGV[0] + "\""
end

file = File.open("file.txt", "rb")
contents = file.read
#puts contents

enc = RC4.new(ARGV[1])
strProc = enc.encrypt(contents)

output = File.new("output.txt", "w+")
output.puts strProc

output.close
file.close

