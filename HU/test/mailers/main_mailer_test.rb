require 'test_helper'

class MainMailerTest < ActionMailer::TestCase
  test "notify_question_author" do
    # Generate some data for test
    question = Question.create email: 'author@question.com', body: 'a test question'
    answer = Answer.create email: 'author@answer.com', body: 'a test answer'
    # Associate answer with question by appending it to answers relation on question
    question.answers << answer

    mail = MainMailer.notify_question_author(answer)

    assert_equal "New answer to your question", mail.subject
    assert_equal [question.email], mail.to
    assert_equal [answer.email], mail.from
    assert_match answer.body, mail.body.encoded
  end

end
