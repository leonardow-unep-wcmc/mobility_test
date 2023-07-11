class Post < ApplicationRecord
  extend Mobility
  translates :title, :content, fallbacks: false

  before_save :sanitize_content

  private

  def sanitize_content
    I18n.available_locales.each do |locale|
      rich_content = public_send("content_#{locale}")
      # TODO: sanitize rich_content
    end
  end
end
