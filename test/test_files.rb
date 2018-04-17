require 'test/unit'
require_relative '../lib/config'
require_relative '../lib/utils/files'

class TestFiles < Test::Unit::TestCase
  self.test_order = :defined

  def test_get_tree
    files = FileBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      files.get_tree('master')
    end
  end

  def test_file_sha
    files = FileBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      files.file_sha('README.md', 'master')
    end
  end

  def test_list_files
    files = FileBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      files.list_files('master').inspect
    end
  end

  def test_branch_sha
    files = FileBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      files.branch_sha('master')
    end
  end

  def test_create_update_delete_file
    c = FileBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      path = 'testsuitefile.md'
      msg = 'from test suite'
      content = '2swag4u'
      c.create_file(path, msg, content, 'master')
      sha = c.file_sha(path, 'master')
      c.update_contents(path, msg, sha, 'updated content', 'master')
      c.delete_file(path, msg, c.file_sha(path, 'master'), 'master')
    end
  end

  def test_get_contents
    files = FileBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      files.get_contents('README.md', 'master')
    end
  end
end
