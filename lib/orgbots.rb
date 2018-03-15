require_relative 'orgbots/version'
require 'octokit'
require 'dotenv/load'

Dotenv.load('orgbot.env')
@client = Octokit::Client.new(access_token: ENV['OCTOKIT_TOKEN'])

# Load some repo configs
repo = @client.repo ENV['REPO']
# add a var here for branch name
ref = 'heads/master'

begin
  file_info = @client.contents(repo.full_name, path: 'README.md', branch: 'master').to_hash
  puts "\n\n👌 Looks good so far"
rescue Octokit::NotFound => e
  puts "😨 #{file} not found in #{repo.full_name}"
  puts e.message
  # you can call create method and then exit
  exit
rescue StandardError => e
  puts "\n\n🔥🔥🔥🔥🔥 You started a fire! 🔥🔥🔥🔥🔥\n\n"
  puts "An error of type #{e.class} happened, message is #{e.message}"
  exit
end

# uncomment for some basic logging
# pp "Content before commit : #{file_info[:path]}"
# pp Base64.decode64(file_info[:content]).delete("\n")

new_content        = 'much wowness'

sha_latest_commit  = @client.ref(repo.full_name, ref).object.sha
sha_base_tree      = @client.commit(repo.full_name, sha_latest_commit).commit.tree.sha
blob_sha           = @client.create_blob(repo.full_name, Base64.encode64(new_content), 'base64')

sha_new_tree       = @client.create_tree(repo.full_name,
                                         [{ path: file_info[:path],
                                            mode: '100644',
                                            type: 'blob',
                                            sha: blob_sha }],
                                         base_tree: sha_base_tree).sha

commit_message      = '👮 WebDevBot always commits directly to master'
sha_new_commit      = @client.create_commit(repo.full_name,
                                            commit_message, sha_new_tree, sha_latest_commit).sha

updated_ref         = @client.update_ref(repo.full_name, ref, sha_new_commit)

# satify the cops - useless variable assignment
puts updated_ref

pp "📈 Content updated : #{file_info[:path]}"
