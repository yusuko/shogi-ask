
module ApplicationHelper
  def text_with_link(text)
    Rinku.auto_link(simple_format(h(text))).html_safe
  end

  def related_questions(categories)
    questions = []
    categories.each do |category|
      questions << category.questions
    end
    questions.flatten
  end
end
