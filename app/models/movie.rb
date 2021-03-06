class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_attached_file :image, styles: { medium: '400x600#' }
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
