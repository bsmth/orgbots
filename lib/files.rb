require 'octokit'

# Inspects or creates blobs etc.
class FileBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
  end

  def get_tree(sha)
    tree = @c.tree(@repo, sha)
    tree.tree.first
  end

  def create_file(path, commit_msg, content, branch)
    @c.create_contents(@repo, path, commit_msg, content, branch: branch)
  end
end
