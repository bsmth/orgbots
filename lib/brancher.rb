require 'octokit'
require 'digest'

# Creates an Orgbot, commits to a given branch
class BranchBot
  def initialize(r, b, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = @c.repo r
    @branch = b
    @ref = "heads/#{@branch}"
  end

  def branch
    sha = '827efc6d56897b048c772eb4087f854f46256132'
    create_ref = @c.create_ref(@repo.full_name, @ref, sha)
    # updated_ref = @c.update_ref(@repo.full_name, @ref, create_ref)
    # satify the cops - useless variable assignment
    puts create_ref.inspect
    puts "BRANCHED : #{file}"
  end
end
