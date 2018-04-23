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

  def commit_rand_branch
    @spinner.auto_spin
    branch = BranchBot.new(@repo, @token).rand_branch
    engage(branch, pick_file(branch), genword, genword)
  end

  def engage(branch, file, content, message)
    CommitBot.new(@repo, branch, @token).commit(file, content, message)
    @spinner.success("📈 Created extreme swag on branch #{branch} in #{file}")
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

  def gen_file
    genword.to_s + txt_ext
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
