require_relative '../utils/utils'
require 'octokit'
require 'random-word'

# Make a commit to a random branch etc.
class RandCommitter
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
    @token = t
  end

  def commit(message)
    content = genword
    randombranch = BranchBot.new(@repo, @token).list_branches.sample
    file = if maybe
             # existing file
             FileBot.new(@repo, @token).list_files(randombranch).sample[:path]
           else
             # create new file with random name
             randword
           end
    CommitBot.new(@repo, randombranch, @token).commit(file, content, message)
    puts "📈 Created extreme swag on branch #{randombranch} in #{file}"
  end

  def maybe
    [true, false].sample
  end

  def genword
    RandomWord.nouns.next
  end

  def gencontent
    RandomWord.nouns.next
  end
end
