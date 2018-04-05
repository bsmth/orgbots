require 'octokit'
require 'dotenv/load'

# Queries, opens and closes Pull Requests in a given repository
class PRBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
    @repo_branches = @c.branches(@repo).collect { |br| br[:name] }
  end

  def get_pr_commits(number)
    @c.pull_request_commits(@repo, number)
  end

  # get prs by open state
  def open_prs
    @c.pull_requests(@repo, state: 'open').collect do |pr|
      [pr[:number], pr[:title], pr[:body]]
    end
    puts @c.pull_requests(@repo, state: 'open').inspect
  end

  # get comments for a specify pr
  def pr_comments(number)
    puts @c.pull_request_comments(@repo, number)
  end

  # list comments for all prs
  def all_pr_comments
    @c.pull_requests_comments(@repo, sort: 'asc', direction: 'down')
  end

  def create_pr(base, branch, title, body)
    @c.create_pull_request(@repo, base, branch, title, body)
    puts "Created pull request for #{branch}"
  rescue Octokit::UnprocessableEntity => e
    puts e.message
  end

  # comment on a PR - requires the commit sha, file and position
  def create_pr_comment(pull_id, comment, commit_id, file, position)
    @c.create_pull_request_comment(@repo, pull_id, comment, commit_id, file, position)
  end

  def pr_reply(pull_id, body, comment_id)
    @c.create_pull_request_comment_reply(@repo, pull_id, body, comment_id)
  end

  def approve_pr(pr_number)
    @c.create_pull_request_review(@repo, pr_number, event: 'APPROVE')
  end

  def approve_pr_with_comment(pr_number, file, pos, comment)
    comments = [
      { path: file, position: pos, body: comment }
    ]
    options = { event: 'APPROVE', comments: comments }
    @c.create_pull_request_review(@repo, pr_number, options)
  end
end
