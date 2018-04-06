require_relative '../utils/utils'
require_relative 'random_commit'
require_relative 'diff'
require 'octokit'

Dotenv.load('orgbot.env')
r = ENV['REPO']
t = ENV['TOKEN']

# RandCommitter.new(r, t).commit
# puts Differ.new(r, t).hooks
# CommitBot.new(r, b, t).commit(file, content, message)

branch = 'master'

lines = %(# NXT, standalone part

NXT is an unoriginal name for Chromium’s investigation and prototyping of a NeXT generation graphics API for the Web. This repository contains a native library implementing NXT on multiple backends, as well as some code generators used for the integration in Chromium. NXT is not an official Google product.

We focused on efforts on two axis:

- An investigation of the constraints coming from the Web and in particular portability, for which we looked at the intersection of the designs of D3D12, Metal, Vulkan, OpenGL and D3D11. See links to some of our investigations below.
- A prototype API inspired by all of D3D12, Metal and Vulkan, but none in particular. The API works on two backends: OpenGL and Metal and is usable from native code (think WebAssembly) and from Javascript inside of Chrome. Our focus was not to have a complete API but to show the breadth of potential usage.

We’re making our investigation and prototype public to provide another example for the upcoming discussion in the “GPU for the Web” W3C community group.

NXT currently has the following features:

- Command buffers, graphics and compute pipelines
- Textures, samplers, vertex / index / uniform / storage buffers.
- Descriptor sets (called bind groups) and push constants
- SPIRV for the shading language
- Validation)

message = 'ungarble'
path = FileBot.new(r, t).list_files(branch).collect { |file| file[:path] }
examplefile = path[3]
CommitBot.new(r, branch, t).commit(examplefile, lines, message)

content = FileBot.new(r, t).get_contents(examplefile, branch)[:content]
decoded = Base64.decode64(content)

# grab a slice of delicious file
numlines = 4
lines = decoded.lines
length = lines.length
rand_line = rand(lines.length)
stop = rand_line + numlines - 1
slice = lines[rand_line..stop]

#  make some random edit to a slice of the file
rev_slice = slice.reverse.flatten
lines[rand_line, stop] = rev_slice
lines = lines.flatten

# commit the garbage
message = 'garbling'
CommitBot.new(r, branch, t).commit(examplefile, lines[0], message)
