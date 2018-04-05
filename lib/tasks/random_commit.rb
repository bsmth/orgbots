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
    file = pick_file(randombranch)
    file = genword.to_s + extension if maybe
    CommitBot.new(@repo, randombranch, @token).commit(file, content, message)
    puts "📈 Created extreme swag on branch #{randombranch} in #{file}"
  end

  def pick_file(branch)
    FileBot.new(@repo, @token).list_files(branch).sample[:path]
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

  def extension
    ['.txt', '.md'].sample
  end
end
