require 'octokit'

# Queries Issues in a given repository
class IssueBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @c.auto_paginate = true
    @repo = r
  end

  def list_issues
    issues = @c.list_issues(@repo)
    puts issues.inspect
  end

  def create_issue(title, description)
    @c.create_issue(@repo, title, description)
  end
end
