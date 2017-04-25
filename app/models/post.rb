class Post < ActiveRecord::Base
	belongs_to :user

	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_many :likes_users, :through => :likes, :class_name => 'User'

	validates :image, presence: true
	validates :user_id, presence: true

	# Let Paperclip know that this requires an attached file, and resize that image to the width provided.
	# The resizing is handled by ImageMagick.
	has_attached_file :image, styles: {
		size:  "600x"
	}
	do_not_validate_attachment_file_type :image
end
