require 'octokit'

# Queries, opens and closes issues in a given repository
class ReactBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
  end

  # see https://developer.github.com/v3/reactions/#reaction-types
  def issue_comment_react(comment_id, reaction)
    @c.create_issue_comment_reaction(@repo, comment_id, reaction)
  end

  def issue_react(issue_id, reaction)
    @c.create_issue_reaction(@repo, issue_id, reaction)
  end

  def randemoji(multiple)
    moji = Octokit.emojis.to_a.sample(multiple)
    str = ''
    moji.each { |a| str += ":#{a[0]}: " }
    str
  end
end
