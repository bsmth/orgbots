require_relative '../utils/utils'
require 'octokit'
require 'random-word'

# Make a commit to a random branch etc.
class RandCommit
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @pastel = Pastel.new
    @repo = r
    @token = t
    format = "[#{@pastel.yellow(':spinner')}] " + @pastel.yellow('GitHubbing...')
    @spinner = TTY::Spinner.new(format, success_mark: @pastel.green('+'))
  end

  def commit
    @spinner.auto_spin
    content = genword
    randombranch = BranchBot.new(@repo, @token).rand_branch
    file = pick_file(randombranch)
    file = genword.to_s + txt_ext if maybe
    CommitBot.new(@repo, randombranch, @token).commit(file, content, genword)
    @spinner.success("📈 Created extreme swag on branch #{randombranch} in #{file}")
  end

  def shuffle_file(branch, file, content, message)
    @spinner.auto_spin
    lines = Base64.decode64(content).lines.shuffle.flatten.join
    CommitBot.new(@repo, branch, @token).commit(file, lines, message)
    @spinner.success("📈 Created extreme swag on branch #{branch} in #{file}")
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
