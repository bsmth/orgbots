require 'test/unit'
require_relative '../lib/config'

Dotenv.load('orgbot.env')

class TestCommit < Test::Unit::TestCase
  def test_repo
    bot = CommitBot.new(ENV['REPO'], 'master', ENV['TOKEN'])
    file = 'test.txt'
    content = 'cooltest'
    message = 'testmessage'
    assert_nothing_raised do
      bot.commit(file, content, message)
    end
  end
end
