class Person < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :organization

  def self.search(q)
    self.where("LOWER(name) LIKE LOWER(?)", "%#{q}%")
  end
end
