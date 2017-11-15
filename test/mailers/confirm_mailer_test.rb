require 'test_helper'

class ConfirmMailerTest < ActionMailer::TestCase
  test "new_confirmation" do
    mail = ConfirmMailer.new_confirmation
    assert_equal "New confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
