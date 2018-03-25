require 'octokit'

# Creates an Orgbot, commits to a given branch
class CommitBot
  def initialize(r, b, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = @c.repo r
    @branch = b
    @ref = "heads/#{@branch}"
  end

  def getbasetree
    @sha_latest_commit = @c.ref(@repo.full_name, @ref).object.sha
  rescue Octokit::NotFound => e
    puts e.message
    # create ref
    exit
    @sha_base_tree = @c.commit(@repo.full_name, @sha_latest_commit).commit.tree.sha
    self
  end

  # ex '2012-11-01'
  def get_commits(start, endd)
    @c.commits_between(@repo, start, endd)
  end

  # Refactor or remove
  def commit(file, content, message)
    blob_sha = @c.create_blob(@repo.full_name, Base64.encode64(content), 'base64')
    sha_new_tree = @c.create_tree(@repo.full_name,
                                  [{ path: file, mode: '100644', type: 'blob', sha: blob_sha }],
                                  base_tree: @sha_base_tree).sha
    sha_new_commit = @c.create_commit(@repo.full_name,
                                      message, sha_new_tree, @sha_latest_commit).sha
    updated_ref = @c.update_ref(@repo.full_name, @ref, sha_new_commit)
    # satify the cops - useless variable assignment
    puts updated_ref.inspect
    puts "📈 Content updated : #{file}"
  end
end
