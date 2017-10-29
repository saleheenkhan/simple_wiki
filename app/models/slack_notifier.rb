class SlackNotifer
  class SlackNotifier

  def initialize(article_id, user_id)
    @article = Article.find(article_id)
    @user = User.find(user_id)
    @notifier = Slack::Notifier.new "your_slack_webook_url"

  end

  def create
    @notifier.ping "Article [#{@article.name}](http://example.com/articles/#{@article.slug}) has been created by #{@user.full_name}"
  end

  def update
    @notifier.ping "Article [#{@article.name}](http://example.com/articles/#{@article.slug}) has been updated by #{@user.full_name}"
  end
end

end
