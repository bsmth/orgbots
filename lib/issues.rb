require 'octokit'

# Queries, opens and closes issues in a given repository
class IssueBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
  end

  # list all issues for the repository
  def list_issues
    issues = @c.list_issues(@repo)
    puts "#{@repo} has #{issues.length} issues"
  end

  # list all open issues for the repository
  def open_issues
    issues = @c.list_issues(@repo, state: 'open')
    puts "#{@repo} has #{issues.length} open issues"
  end

  # list all closed issues for the repository
  def closed_issues
    issues = @c.list_issues(@repo, state: 'closed')
    puts "#{@repo} has #{issues.length} closed issues"
  end

  # add a comment to an issue number
  def comment(number, comment)
    @c.add_comment(@repo, number, comment)
  end

  # Sort all open issues by most commented
  def most_commented
    issues = @c.list_issues(@repo, state: 'open', sort: 'comments', direction: 'descending')
    puts "Issue \##{issues[0][:number]} is the most commented"
  end

  # Sort all open issues by least commented
  def least_commented
    issues = @c.list_issues(@repo, state: 'open', sort: 'comments', direction: 'ascending')
    puts "Issue \##{issues[0][:number]} is the least commented"
  end

  # Create a new issue
  def create_issue(title, body)
    @c.create_issue(@repo, title, body)
  end

  # ronseal
  def close_issue(number)
    @c.close_issue(@repo, number)
  end
end
