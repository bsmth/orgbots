require_relative '../utils/utils'
require 'octokit'
require 'random-word'

# Make a commit to a random branch etc.
class RandCommit
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
    @token = t
  end

  def commit
    content = genword
    randombranch = BranchBot.new(@repo, @token).list_branches.sample
    file = pick_file(randombranch)
    file = genword.to_s + txt_ext if maybe
    CommitBot.new(@repo, randombranch, @token).commit(file, content, genword)
    puts "📈 Created extreme swag on branch #{randombranch} in #{file}"
  end

  def shuffle_file(branch, file, content, message)
    lines = Base64.decode64(content).lines.shuffle.flatten.join
    CommitBot.new(@repo, branch, @token).commit(file, lines, message)
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

  def txt_ext
    ['.txt', '.md'].sample
  end

  def code_ext
    ['.js', '.rb', '.py', '.sh'].sample
  end
end
