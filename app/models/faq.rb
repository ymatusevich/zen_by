class Faq
  include Mongoid::Document

  field :title,           type: String
  field :description,     type: String

  belongs_to :tour
  belongs_to :home_page
end
