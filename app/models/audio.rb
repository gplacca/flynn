class Audio < ApplicationRecord
  belongs_to :user, optional: true
  has_many :audios_playlists, dependent: :destroy
  has_many :playlists, through: :audios_playlists
  # has_one_attached :audiofile

  FILE_EXTENSION = 'mp3'.freeze
end
