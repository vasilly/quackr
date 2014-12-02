class Question < ActiveRecord::Base
  validates :title, :presence => true

  def body_html
    return "" unless self.body

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(self.body)
  end

end
