require 'simplecov'
require_relative '../lib/config'
require_relative '../lib/utils/files'

SimpleCov.start do
  add_filter '/test/'
end

# fb = FileBot.new(ENV['REPO'], ENV['TOKEN'])
# file = 'testsuitefile.md'
# branch = 'master'
# sha = fb.file_sha(branch, file)
# # if there is the test file on the branch, delete it!
# fb.delete_file(file, 'pre-test cleanup', sha, branch) if (sha)
