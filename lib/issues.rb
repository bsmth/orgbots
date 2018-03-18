require 'octokit'

# Queries, opens and closes issues in a given repository
class IssueBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
  end

  def list_issues
    issues = @c.list_issues(@repo)
    puts "#{@repo} has #{issues.length} issues"
  end

  def create_issue(title, description)
    @c.create_issue(@repo, title, description)
  end

  def close_issue(number)
    @c.close_issue(@repo, number)
  end
end
