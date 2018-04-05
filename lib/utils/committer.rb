require 'octokit'
require 'base64'

# Creates an Orgbot, commits to a given branch
class CommitBot
  def initialize(r, b, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
    @branch = b
    @sha_latest_commit = @c.ref(@repo, "heads/#{@branch}").object.sha
    @sha_base_tree = @c.commit(@repo, @sha_latest_commit).commit.tree.sha
  end

  def commit(file, content, message)
    blob_sha = @c.create_blob(@repo, Base64.encode64(content), 'base64')
    file_opts = [{ path: file, mode: '100644', type: 'blob', sha: blob_sha }]
    sha_new_tree = @c.create_tree(@repo, file_opts, base_tree: @sha_base_tree).sha
    sha_new_commit = @c.create_commit(@repo, message, sha_new_tree, @sha_latest_commit).sha
    @c.update_ref(@repo, "heads/#{@branch}", sha_new_commit)
  end
end
