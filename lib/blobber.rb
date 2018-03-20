require 'octokit'

# Inspects or creates blobs etc.
class BlobBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
  end

  def get_tree(sha)
    tree = @c.tree(@repo, sha)
    tree.tree.first
  end
end
