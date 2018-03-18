require 'octokit'

# Queries, opens and closes Pull Requests in a given repository
class PRBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
    @repo_branches = @c.branches(@repo).collect { |br| br[:name] }
  end

  def open_pr(base, branch, title, body)
    @c.create_pull_request(@repo, base, branch, title, body)
  rescue Octokit::UnprocessableEntity => e
    puts e.message
  end

  def open_prs
    @c.pull_requests(@repo, state: 'open')
  end

  def pr_comments
    puts @c.pull_request_comments(@repo)
  end
end
