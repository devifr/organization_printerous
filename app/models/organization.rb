class Organization < ApplicationRecord
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  has_one :account_manager, foreign_key: 'organization_id'
  has_many :pics, class_name: 'Person', foreign_key: 'organization_id'

  def self.search(q)
    self.where("LOWER(name) LIKE LOWER(?)", "%#{q}%")
  end

end
