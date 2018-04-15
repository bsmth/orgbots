require 'octokit'

# Creates a branch in given repo
class BranchBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
    @token = t
  end

  def list_branches
    @c.branches(@repo).collect { |br| br[:name] }
  end

  def create_branch(branch, base)
    if list_branches.include?(branch)
      puts "Branch #{branch} already exists in #{@repo}"
    else
      ref = @c.ref(@repo, "heads/#{base}")
      sha = ref[:object][:sha]
      create_ref = @c.create_ref(@repo, 'heads/' + branch, sha)
      puts "Created branch #{create_ref[:ref]}"
    end
  end

  def delete_branch(branch)
    @c.delete_ref(@repo, 'heads/' + branch) if list_branches.include?(branch)
    puts "Deleting #{branch} from #{@repo}"
  end

  def rand_branch
    BranchBot.new(@repo, @token).list_branches.sample.to_s
  end
end
