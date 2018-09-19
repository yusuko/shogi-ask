
module ApplicationHelper
  def default_meta_tags
  {
    title: '将棋アスク',
    reverse: true,
    charset: 'utf-8',
    description: '将棋アスクは、将棋に特化した無料Q&Aサイトです。将棋の入門・上達のコツ、オススメの本や戦法について質問できます。また、指し将棋だけでなく、プロ棋士や将棋ソフトについても質問できます。質問をすると素早く回答が返ってきます。知識、情報の共有ができる将棋サイトです。',
    keywords: '将棋 初心者 質問',
    canonical: request.original_url,
    separator: '|',
    og: {
      title: '将棋アスク',
      description: '将棋アスクは、将棋に特化した無料Q&Aサイトです。将棋の入門・上達のコツ、オススメの本や戦法について質問できます。また、指し将棋だけでなく、プロ棋士や将棋ソフトについても質問できます。質問をすると素早く回答が返ってきます。知識、情報の共有ができる将棋サイトです。',
      type: 'website',
      url: request.original_url,
      locale: 'ja_JP',
    }
  }
  end

  def full_title(page_title = '')
  base_title = '将棋アスク'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def text_with_link(text)
    Rinku.auto_link(simple_format(h(text))).html_safe
  end

  def related_questions(categories)
    questions = []
    categories.each do |category|
      questions << category.questions
    end
    questions.flatten.take(5)
  end
end
