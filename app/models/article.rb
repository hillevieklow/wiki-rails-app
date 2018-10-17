class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :favorites

  def self.sort_by(sort_column)
    order = ["upvotes", "updated_at"].include?(sort_column) ? :desc : :asc
    if sort_column == "category"
      Article.joins(:category).merge(Category.order(name: order))
    else
      Article.order("#{sort_column} #{order}")
    end
  end

  def category_name
    self.category ? self.category.name : nil
  end

  def new_category=(data)
    if !data.empty?
        self.category = Category.find_or_create_by(:name => data)
    end
  end

  def new_category
  end

  def self.get_latest(number_articles)
    self.last(number_articles).sort { |x,y| y.created_at <=> x.created_at }
  end
end
