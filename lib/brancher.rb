require 'octokit'

# Creates a branch in given repo
class BranchBot
  def initialize(r, b, t)
    @c = Octokit::Client.new(access_token: t)
    @c.auto_paginate = true
    @repo = r
    @branch = b
    @ref = "heads/#{@branch}"
    @repo_branches = @c.branches(@repo).collect { |br| br[:name] }
  end

  def create_branch
    if @repo_branches.include?(@branch)
      puts "Branch #{@branch} already exists in #{@repo}"
    else
      # branch from master?
      ref = @c.ref(@repo, 'heads/master')
      sha = ref[:object][:sha]
      create_ref = @c.create_ref(@repo, 'heads/' + @branch, sha)
      puts "Created branch #{create_ref[:ref]}"
    end
  end

  def delete_branch
    puts "Deleting #{@branch} from #{@repo}"
    @c.delete_ref(@repo, 'heads/' + @branch) if @repo_branches.include?(@branch)
  end
end
