require_relative '../utils/utils'
require_relative 'random_commit'
require 'octokit'

# Begs to differ
# Probably deprecated by now
class Differ
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
    @token = t
    @genword = RandCommit.new(r, t).genword
  end

  def hooks
    @c.hooks(@repo)
  end

  def nice_commit
    content = @genword
    randombranch = BranchBot.new(@repo, @token).list_branches.sample
    file = pick_file(randombranch)
    file = @genword.to_s + txt_ext if maybe
    CommitBot.new(@repo, randombranch, @token).commit(file, content, @genword)
    puts "📈 Created extreme swag on branch #{randombranch} in #{file}"
  end
end
