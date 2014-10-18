class Result

  def initialize(question)
    @option_a_votes = question.a_votes
    @option_b_votes = question.b_votes
    @option_c_votes = question.c_votes
    @option_d_votes = question.d_votes
    @total_votes = @option_a_votes + @option_b_votes + @option_c_votes + @option_d_votes
    @correct_answer = (question.answer + 96).chr.upcase
    @question = question
  end
end