require 'octokit'

# Inspects or creates blobs etc.
class FileBot
  def initialize(r, t)
    @c = Octokit::Client.new(access_token: t)
    @repo = r
  end

  def get_tree(sha)
    tree = @c.tree(@repo, sha, recursive: true)
    tree.tree
  end

  def file_sha(path, branch)
    files = list_files(branch)
    files.select { |obj| obj['path'] == path }.first[:sha]
  end

  def list_files(branch)
    get_tree(branch_sha(branch))
  end

  def branch_sha(branch)
    @c.ref(@repo, "heads/#{branch}")[:object][:sha]
  end

  def create_file(path, commit_msg, content, branch)
    @c.create_contents(@repo, path, commit_msg, content, branch: branch)
  end

  def delete_file(path, msg, sha, branch)
    @c.delete_contents(@repo, path, msg, sha, branch: branch)
  end

  def update_contents(path, commit_msg, sha, content, branch)
    @c.update_contents(@repo, path, commit_msg, sha, content, branch: branch)
  end

  # Get the contents of a file, note that ref can be a commit, branch or tag
  def get_contents(path, ref)
    @c.contents(@repo, path: path, ref: ref)
  end
end
